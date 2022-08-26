using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace _180808
{
    public partial class login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //读取cookie的值
            if (Request.Cookies["UserInfo"] != null)
            {
                txtUserName.Text = Request.Cookies["UserInfo"]["USERNAME"].ToString();
                txtPwd.Text = Request.Cookies["UserInfo"]["PASSWORD"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = txtUserName.Text.Trim();
            string pwd = txtPwd.Text.Trim();

            //1.对输入是否为空进行验证
            if (username != "" && pwd != "")
            {
                //2.对输入的用户名、密码是否匹配进行验证
                if (IsUser(username, pwd))
                {
                    //3.验证成功时，创建session
                    Session.Add("USER", username);
                    Session.Add("PWD", pwd);
                    //4.对cookie进行设置
                    //4.1当用户勾选了“记住用户信息”的复选框时
                    if (CheckBox1.Checked)
                    {
                        //4.1.1创建cookie
                        HttpCookie mycookie = new HttpCookie("UserInfo");
                        mycookie.Values.Add("USERNAME", username);
                        mycookie.Values.Add("PASSWORD", pwd);
                        //4.1.2设置cookie的过期时间
                        mycookie.Expires = DateTime.Now.AddDays(7);
                        //4.1.3将cookie写到客户端
                        Response.Cookies.Add(mycookie);
                    }

                    //4.2当用户没有勾选复选框时，则清除以前的cookie
                    else
                    {
                        if (Request.Cookies["UserInfo"] != null)
                        {
                            //4.2.1设置cookie立刻过期
                            Response.Cookies["UserInfo"].Expires = DateTime.Now.AddDays(-1);
                        }
                    }
                    Response.Redirect("member.aspx");
                }

                //当输入的用户名、密码不匹配时
                else
                {
                    lbMsg.Text = "您的输入有误，请重新输入！";
                }

            }

            //当有未输入项时
            else
            {
                lbMsg.Text = "用户名和密码均不可为空值！";
            }
        }

        protected bool IsUser(string user, string pwd)
        {
            string sqlStr = string.Format("Select * From [USER_INFO] Where UserName='{0}' And Password='{1}'", user, pwd);
            //SqlCommand conn = new SqlCommand(sqlStr, conn);
            //conn.Open();
            if (db.getSqlDataReader(sqlStr).Read())
            {
                return true;
            }
            else
            {
                return false;
            }
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            string username = TextBox1.Text.Trim();
            string pwd = TextBox2.Text.Trim();

            //1.对输入是否为空进行验证
            if (username != "" && pwd != "")
            {
                //2.对输入的用户名、密码是否匹配进行验证
                if (IsManager(username, pwd))
                {
                    //3.验证成功时，创建session
                    Session.Add("MANAGERNAME", username);
                    Session.Add("PWD", pwd);
                    //4.对cookie进行设置
                    //4.1当用户勾选了“记住用户信息”的复选框时
                    if (CheckBox1.Checked)
                    {
                        //4.1.1创建cookie
                        HttpCookie mycookie = new HttpCookie("UserInfo");
                        mycookie.Values.Add("MANAGERNAME", username);
                        mycookie.Values.Add("PASSWORD", pwd);
                        //4.1.2设置cookie的过期时间
                        mycookie.Expires = DateTime.Now.AddDays(7);
                        //4.1.3将cookie写到客户端
                        Response.Cookies.Add(mycookie);
                    }

                    //4.2当用户没有勾选复选框时，则清除以前的cookie
                    else
                    {
                        if (Request.Cookies["UserInfo"] != null)
                        {
                            //4.2.1设置cookie立刻过期
                            Response.Cookies["UserInfo"].Expires = DateTime.Now.AddDays(-1);
                        }
                    }

                   

                    if(RadioButtonList1.SelectedValue == null)
                    {
                        Label8.Text = "您没有选择的管理员类型，请进行选择！";
                    }
                    else
                    {
                        //读值
                        string ManagerRole;
                        string sqlconnstr = ConfigurationManager.ConnectionStrings["DB180808ConnectionString"].ConnectionString;
                        SqlConnection sqlconn = new SqlConnection(sqlconnstr);
                        SqlCommand sqlcommand = new SqlCommand();
                        sqlcommand.Connection = sqlconn;
                        sqlconn.Open();
                        sqlcommand.CommandText = "select * from MANAGER_INFO where UserName=@UserName";
                        sqlcommand.Parameters.AddWithValue("@UserName", username);
                        SqlDataReader sqldatareader = sqlcommand.ExecuteReader();
                        if (sqldatareader.Read())
                        {
                            ManagerRole = sqldatareader.GetString(4);

                            if (RadioButtonList1.SelectedValue == ManagerRole)
                            {
                                switch (RadioButtonList1.SelectedValue)
                                {
                                    case "用户管理员":
                                        {
                                            Response.Redirect("userManage.aspx");
                                            break;
                                        }
                                    case "商品管理员":
                                        {
                                            Response.Redirect("ProductManager.aspx");
                                            break;
                                        }
                                    case "订单管理员":
                                        {
                                            Response.Redirect("orderManager.aspx");
                                            break;
                                        }
                                    case "支付管理员":
                                        {
                                            Response.Redirect("payManager.aspx?username=" + username);
                                            break;
                                        }
                                    case "配送管理员":
                                        {
                                            Response.Redirect("deliveryManager.aspx?username=" + username);
                                            break;
                                        }
                                    case "全局管理员":
                                        {
                                            Response.Redirect("allManager.aspx?username=" + username);
                                            break;
                                        }
                                    default: break;

                                }
                            }
                        else
                            {
                                Label8.Text = "您选择的管理员类型有误，请重新选择！";
                            }
                        }
                        sqlcommand = null;
                        sqlconn.Close();
                        sqlconn = null;

                    }
                    
                    
                }

                //当输入的用户名、密码不匹配时
                else
                {
                    Label8.Text = "您的输入有误，请重新输入！";
                }

            }

            //当有未输入项时
            else
            {
                Label8.Text = "用户名和密码均不可为空值！";
            }
        }

        protected bool IsManager(string user, string pwd)
        {
            string sqlStr = string.Format("Select * From [MANAGER_INFO] Where UserName='{0}' And Password='{1}'", user, pwd);
            //SqlCommand conn = new SqlCommand(sqlStr, conn);
            //conn.Open();
            if (db.getSqlDataReader2(sqlStr).Read())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}