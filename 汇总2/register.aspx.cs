using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace _180808
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //用户输入
            txtUserName.Attributes.Add("Value", "请输入用户名");
            txtUserName.Attributes.Add("OnFocus", "if(this.value=='请输入用户名') {this.value=''}");
            txtUserName.Attributes.Add("OnBlur", "if(this.value==''){this.value='请输入用户名'}");
            //密码输入
            txtPwd.Attributes.Add("Value", "请输入密码");
            txtPwd.Attributes.Add("OnFocus", "if(this.value=='请输入密码'){this.value='';this.TextMode=Password}}");
            txtPwd.Attributes.Add("OnBlur", "if(this.value==''){this.value='请输入密码';this.TextMode=SingleLine}");
            //密码确认
            txtPwd2.Attributes.Add("Value", "密码确认");
            txtPwd2.Attributes.Add("OnFocus", "if(this.value=='密码确认'){this.value=''}");
            txtPwd2.Attributes.Add("OnBlur", "if(this.value==''){this.value='密码确认'}");
            //电子邮件
            txtEmail.Attributes.Add("Value", "（非必填项）邮箱");
            txtEmail.Attributes.Add("OnFocus", "if(this.value=='（非必填项）邮箱'){this.value=''}");
            txtEmail.Attributes.Add("OnBlur", "if(this.value==''){this.value='（非必填项）邮箱'}");
            //联系方式
            txtTel.Attributes.Add("Value", "（非必填项）联系方式");
            txtTel.Attributes.Add("OnFocus", "if(this.value=='（非必填项）联系方式'){this.value=''}");
            txtTel.Attributes.Add("OnBlur", "if(this.value==''){this.value='（非必填项）联系方式'}");

        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            string username = txtUserName.Text.Trim();
            string pwd = txtPwd.Text.Trim();
            string pwd2 = txtPwd2.Text.Trim();
            string email = txtEmail.Text.Trim();
            string tel = txtTel.Text.Trim();

            if (username == "请输入用户名")
            {
                lbMsg.Text = "用户名不能为空！";
                return;
            }

            //建立连接
            //配置命令对象
            string sqlStr = string.Format("Insert Into [USER_INFO] (UserName,Password,Email,Telephone) Values ('{0}','{1}','{2}','{3}')", username, pwd, email, tel);
            //判断用户名是否可用
            if (IsNewUser(username))
            {
                if (db.ExecuteSqlCommand(sqlStr))
                {
                    if (pwd != pwd2)
                    {
                        lbMsg.Text = "两次输入的密码不一致！";
                    }
                    else
                    {
                        lbMsg.Text = "注册成功！";
                        Response.Redirect("member.aspx");
                    }
                }
                else
                {
                    lbMsg.Text = "注册失败！";
                }
            }
            else
            {
                lbMsg.Text = "该用户名已被占用，请重新选择！";
                txtUserName.Text = "";
            }
        }

        //自定义的方法
        protected bool IsNewUser(string user)
        {
            string sqlStr = string.Format("Select * From [USER_INFO] Where UserName='{0}'", user);
            //SqlCommand conn = new SqlCommand(sqlStr, conn);
            //conn.Open();
            if (!db.getSqlDataReader(sqlStr).Read())
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            txtUserName.Text = "";
            txtPwd.Text = "";
            txtPwd2.Text = "";
            txtEmail.Text = "";
            txtTel.Text = "";
        }
    }
}