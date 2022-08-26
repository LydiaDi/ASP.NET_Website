using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

public partial class member : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        if (Session["USER"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    if (Session["USER"] != null)
            {
                lbUser.Text =Session["USER"].ToString();
            }

            TextBox1.Attributes.Add("Value", "输入欲修改的密码");
            TextBox1.Attributes.Add("OnFocus", "if(this.value=='请输入用户名') {this.value=''}");
            TextBox1.Attributes.Add("OnBlur", "if(this.value==''){this.value='请输入用户名'}");

            TextBox2.Attributes.Add("Value", "输入邮箱");
            TextBox2.Attributes.Add("OnFocus", "if(this.value=='请输入用户名') {this.value=''}");
            TextBox2.Attributes.Add("OnBlur", "if(this.value==''){this.value='请输入用户名'}");
           
            TextBox3.Attributes.Add("Value", "输入联系方式");
            TextBox3.Attributes.Add("OnFocus", "if(this.value=='请输入用户名') {this.value=''}");
            TextBox3.Attributes.Add("OnBlur", "if(this.value==''){this.value='请输入用户名'}");

            //读值
            string sqlconnstr = ConfigurationManager.ConnectionStrings["DB180808ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            SqlCommand sqlcommand = new SqlCommand();
            sqlcommand.Connection = sqlconn;
            sqlconn.Open();
            sqlcommand.CommandText = "select * from USER_INFO where UserName=@UserName";
            sqlcommand.Parameters.AddWithValue("@UserName", lbUser.Text.Trim());
            SqlDataReader sqldatareader = sqlcommand.ExecuteReader();
            if (sqldatareader.Read())
            {
                if (sqldatareader.IsDBNull(4)|| sqldatareader.GetString(4)== "（非必填项）邮箱") { lbEmail.Text = "尚未填写"; }
                else { lbEmail.Text = sqldatareader.GetString(4); }

                if (sqldatareader.IsDBNull(10)|| sqldatareader.GetString(10) == "（非必填项）联系方式") { lbTel.Text = "尚未填写"; }
                else { lbTel.Text = sqldatareader.GetString(10); }
            }
            else{
                lbEmail.Text="读值没有成功";
            }
            sqlcommand = null;
            sqlconn.Close();
            sqlconn = null;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool fileValid = true;
            if (FileUpload1.HasFile)
            {
                string fileExtName = Path.GetExtension(this.FileUpload1.FileName);
                string[] webExtName = { ".jpg", ".png", ".gif", ".jpeg", ".bmp" };
                for (int i = 0; i <= webExtName.Length - 1; i++)
                {
                    if (fileExtName == webExtName[i])
                    {
                        fileValid = true;
                    }
                }
            }

            if (fileValid)
            {
                try
                {
                    this.FileUpload1.SaveAs(Server.MapPath("img/") + FileUpload1.FileName);
                    Image2.ImageUrl = "img/" + FileUpload1.FileName;
                    Label5.Text = "上传成功！";
                }
                catch (Exception ex)
                {
                    Label5.Text = "上传出错";
                }
            }
            // else
            //{
            //    Label5.Text = "文件类型不符合要求";
            //}}

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int intUpdateCount;
            string sqlconnstr = ConfigurationManager.ConnectionStrings["DB180808ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            SqlCommand sqlcommand = new SqlCommand();
            sqlcommand.Connection = sqlconn;
            sqlcommand.CommandText = "update USER_INFO set Password=@Password where UserName=@UserName";
            sqlcommand.Parameters.AddWithValue("@UserName", lbUser.Text);
            sqlcommand.Parameters.AddWithValue("@Password", TextBox1.Text);
            try
            {
                sqlconn.Open();
                intUpdateCount = sqlcommand.ExecuteNonQuery();

                if (sqlcommand.ExecuteNonQuery() > 0)
                {
                    Label6.Text = "修改成功";
                }
                else
                {
                    Label6.Text = "未修改成功";
                }
            }
            catch (Exception ex) { Label6.Text = "错误原因:" + ex.Message; }
            finally
            {
                sqlcommand = null;
                sqlconn.Close();
                sqlconn = null;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int intUpdateCount;
            string sqlconnstr = ConfigurationManager.ConnectionStrings["DB180808ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            SqlCommand sqlcommand = new SqlCommand();
            sqlcommand.Connection = sqlconn;
            sqlcommand.CommandText = "update USER_INFO set Email=@Email where UserName=@UserName";
            sqlcommand.Parameters.AddWithValue("@UserName", lbUser.Text);
            sqlcommand.Parameters.AddWithValue("@Email", TextBox2.Text);
            try
            {
                sqlconn.Open();
                intUpdateCount = sqlcommand.ExecuteNonQuery();

                if (sqlcommand.ExecuteNonQuery() > 0)
                {
                    Label4.Text = "修改成功";
                }
                else
                {
                    Label4.Text = "未修改成功";
                }
            }
            catch (Exception ex) { Label4.Text = "错误原因：" + ex.Message; }
            finally
            {
                sqlcommand = null;
                sqlconn.Close();
                sqlconn = null;
            }

            //再次读值
            string sqlconnstr2 = ConfigurationManager.ConnectionStrings["DB180808ConnectionString"].ConnectionString;
            SqlConnection sqlconn2 = new SqlConnection(sqlconnstr2);
            SqlCommand sqlcommand2 = new SqlCommand();
            sqlcommand2.Connection = sqlconn2;
            sqlconn2.Open();
            sqlcommand2.CommandText = "select * from USER_INFO where UserName=@UserName";
            sqlcommand2.Parameters.AddWithValue("@UserName", lbUser.Text);
            SqlDataReader sqldatareader = sqlcommand2.ExecuteReader();
            if (sqldatareader.Read())
            {
                lbEmail.Text = sqldatareader.GetString(4);
            }
            sqlcommand2 = null;
            sqlconn2.Close();
            sqlconn2 = null;

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            int intUpdateCount;
            string sqlconnstr = ConfigurationManager.ConnectionStrings["DB180808ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(sqlconnstr);
            SqlCommand sqlcommand = new SqlCommand();
            sqlcommand.Connection = sqlconn;
            sqlcommand.CommandText = "update USER_INFO set Telephone=@Telephone where UserName=@UserName";
            sqlcommand.Parameters.AddWithValue("@UserName", lbUser.Text);
            sqlcommand.Parameters.AddWithValue("@Telephone", TextBox3.Text);
            try
            {
                sqlconn.Open();
                intUpdateCount = sqlcommand.ExecuteNonQuery();

                if (sqlcommand.ExecuteNonQuery() > 0)
                {
                    Label7.Text = "修改成功";
                }
                else
                {
                    Label7.Text = "未修改成功";
                }
            }
            catch (Exception ex) { Label7.Text = "错误原因：" + ex.Message; }
            finally
            {
                sqlcommand = null;
                sqlconn.Close();
                sqlconn = null;
            }

            //再次读值
            string sqlconnstr2 = ConfigurationManager.ConnectionStrings["DB180808ConnectionString"].ConnectionString;
            SqlConnection sqlconn2 = new SqlConnection(sqlconnstr);
            SqlCommand sqlcommand2 = new SqlCommand();
            sqlcommand2.Connection = sqlconn2;
            sqlconn2.Open();
            sqlcommand2.CommandText = "select * from USER_INFO where UserName=@UserName";
            sqlcommand2.Parameters.AddWithValue("@UserName", lbUser.Text);
            SqlDataReader sqldatareader = sqlcommand2.ExecuteReader();
            if (sqldatareader.Read())
            {
                lbTel.Text = sqldatareader["Telephone"].ToString();
            }
            sqlcommand2 = null;
            sqlconn2.Close();
            sqlconn2 = null;
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            switch (Menu1.SelectedValue)
            {
                case "个人中心":
                    {
                        MultiView1.ActiveViewIndex = 0;
                        break;
                    }
                case "消息通知":
                    {
                        MultiView1.ActiveViewIndex = 1;
                        break;
                    }
                case "账号信息":
                    {
                        MultiView1.ActiveViewIndex = 2;
                        break;
                    }

                default:
                break;
            }
        }
    }