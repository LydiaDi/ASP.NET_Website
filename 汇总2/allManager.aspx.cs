using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace _180808
{
    public partial class allManager : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

            string a;
            a = Request.QueryString["username"].ToString();
            Label7.Text = a;
            
            //读值
            string sqlconnstr = ConfigurationManager.ConnectionStrings["DB180808ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            SqlCommand sqlcommand = new SqlCommand();
            sqlcommand.Connection = sqlconn;
            sqlconn.Open();
            sqlcommand.CommandText = "select * from MANAGER_INFO where UserName=@UserName";
            sqlcommand.Parameters.AddWithValue("@UserName", Label7.Text.Trim());
            SqlDataReader sqldatareader = sqlcommand.ExecuteReader();
            if (sqldatareader.Read())
            {
                if (sqldatareader.IsDBNull(4)) { Label5.Text = "尚未填写"; }
                else { Label5.Text = sqldatareader.GetString(4); }

            else
            {
                    Label5.Text = "读值没有成功";
            }
            sqlcommand = null;
            sqlconn.Close();
            sqlconn = null;
        }
        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            switch (Menu1.SelectedValue)
            {
                case "1":
                    {
                        MultiView1.ActiveViewIndex = 0;
                        break;
                    }
                case "2":
                    {
                        MultiView1.ActiveViewIndex = 1;
                        break;
                    }

                default:
                    break;
            }
        }

        protected void Menu2_MenuItemClick(object sender, MenuEventArgs e)
        {
            switch (Menu2.SelectedValue)
            {
                case "1":
                    {
                        MultiView2.ActiveViewIndex = 0;
                        break;
                    }
                case "2":
                    {
                        MultiView2.ActiveViewIndex = 1;
                        break;
                    }
                case "3":
                    {
                        MultiView2.ActiveViewIndex = 2;
                        break;
                    }
                case "4":
                    {
                        MultiView2.ActiveViewIndex = 3;
                        break;
                    }
                case "5":
                    {
                        MultiView2.ActiveViewIndex = 4;
                        break;
                    }
                case "6":
                    {
                        MultiView2.ActiveViewIndex = 5;
                        break;
                    }

                default:
                break;
            }

        }
    }
}