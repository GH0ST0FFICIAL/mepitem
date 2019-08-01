using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    EmpDBEntities db = new EmpDBEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        var data = db.Employees.ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        var data = db.Employees.OrderBy(d=>d.eName).ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        var data = db.Employees.OrderByDescending(d => d.eName).ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        int x = Int32.Parse(TextBox1.Text);
        var data = db.Employees.Where(d => d.id == x).ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        var data = db.Employees.Where(d => d.eName.StartsWith(TextBox1.Text)).ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        var data = db.Employees.Where(d => d.eName.Contains(TextBox1.Text)).ToList();
        GridView1.DataSource = data;
        GridView1.DataBind();
    }

}