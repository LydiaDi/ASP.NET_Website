using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class ConfirmOrder : System.Web.UI.Page
{
    private decimal total = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        //页面第一次加载的时候显示购物车的内容
        if (!IsPostBack)
        {
            DataTable mydt = new DataTable();
            if (Session["Cart"] != null)
            {
                mydt = (DataTable)Session["Cart"];
                GridView1.DataSource = mydt;
                GridView1.DataBind();
                //计算订单总金额
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    total += Convert.ToDecimal(GridView1.Rows[i].Cells[2].Text) * Convert.ToInt32(GridView1.Rows[i].Cells[3].Text);
                }
                IbMsg.Text = "订单总额" + total.ToString();
            }
            else
            {
                Response.Redirect("ShoppingCart.aspx");
            }
        }
    }
    protected void btnOrder_Click(object sender, EventArgs e)
    {
        
        if (Session["Cart"] != null)
        {
            //获取当前用户ID，可以从登录时保存在SESSION里的信息获取
            string userid = "5";//假设当前用户
            DataTable mydt = (DataTable)Session["Cart"];
            //在订单表中新增记录
            string sqlstr = string.Format("Insert Into[ORDER_INFO] ([UserID],[OrderDate],[OrderStatus])Values({0},getDate(),'0')Select SCOPE_IDENTITY() As 'newOrderID'", userid);
            SqlDataReader mySDR = db.getSqlDataReader(sqlstr);
            //
            if (mySDR.Read())//生成新的订单
            {
                //获取当前订单号
                string order_id = mySDR.GetValue(0).ToString();
                IbMsg.Text = "当前订单号为：" + order_id.ToString();
                //生产订单明细
                for (int i = 0; i < mydt.Rows.Count; i++)
                {
                    string pid = mydt.Rows[i][0].ToString();
                    string unitprice = mydt.Rows[i][2].ToString();
                    string amount = mydt.Rows[i][3].ToString();
                    string sqlstrl = string.Format("Insert Into[ORDER_DETAIL]([OrderID],[ProductID],[UnitPrice],[Amount]) Values ({0},{1},{2},{3})", order_id, pid, unitprice, amount);
                    if (db.ExecuteSqlCommand(sqlstrl))
                    {
                        IbMsg.Text += "订单明细生成成功！<br />";
                    }
                    else
                    {
                        IbMsg.Text += "订单明细生成失败！<br />";
                    }

                }
                Session["Cart"] = null;
                btnOrder.Enabled = false;
                IbToPay.Visible = true;
                ClientScript.RegisterClientScriptBlock(GetType(), "", "<script type='text/javascript'>setTimeout(function(){location.href='Pay.aspx'},3000);</script>");

            }
            else
            {
                IbMsg.Text = "订单生成错误，请稍后再试！";
            }

        }
        else 
        {
            IbMsg.Text = "没有选择商品！";
        }
    
    }
}