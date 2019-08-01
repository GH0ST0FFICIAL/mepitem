<%@ WebHandler Language="C#" Class="ItemHandler" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Configuration;
using System.Collections.Generic;

public class ItemHandler : IHttpHandler {
    
    public void ProcessRequest(HttpContext context)
    {
        string term = context.Request["term"] ?? "";

        List<string> listItem = new List<string>();

        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spGetItemTitle", con);
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
                listItem.Add(rdr["Title"].ToString());
            }
        }

        JavaScriptSerializer js = new JavaScriptSerializer();
        context.Response.Write(js.Serialize(listItem));
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}