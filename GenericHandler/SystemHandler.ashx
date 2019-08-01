<%@ WebHandler Language="C#" Class="SystemHandler" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Configuration;
using System.Collections.Generic;

public class SystemHandler : IHttpHandler {
    
    public void ProcessRequest(HttpContext context)
    {
        string term = context.Request["term"] ?? "";

        List<string> listSystem = new List<string>();

        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetSystemTitle", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter()
            {
                ParameterName = "@term",
                Value = term
            });
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                listSystem.Add(rdr["Title"].ToString());
            }
        }

        JavaScriptSerializer js = new JavaScriptSerializer();
        context.Response.Write(js.Serialize(listSystem));
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}