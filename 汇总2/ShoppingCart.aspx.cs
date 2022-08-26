using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml.Schema;

public partial class ShoppingCart : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        if (Session["USER"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }
    private decimal total = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindCartList();
        }

    }
    protected void BindCartList()//绑定数据的方法
    {
        DataTable mydt = new DataTable();//DataTable是DataSet中的一个子集合
        //如果Session中已存在则读入
        if (Session["Cart"] != null)
        {
            mydt = (DataTable)Session["Cart"];
        }
        else//购物车内容为空，要建立数据表对象的结构
        {
            
            mydt.Columns.Add(new DataColumn("Description", typeof(String)));
            mydt.Columns.Add(new DataColumn("ImgUrl1", typeof(String)));
            mydt.Columns.Add(new DataColumn("UnitPrice", typeof(Decimal)));
            mydt.Columns.Add(new DataColumn("Amount", typeof(Int32)));
        }
        //根据传入的id找到商品(前提：传入的id不为空)
        if (Request.QueryString["pid"] != null)
        {
            string pid = Request.QueryString["pid"].ToString();
            //判断该商品是否已经加入购物车
            bool IsExist = false;
            foreach (DataRow dr in mydt.Rows)
            {
                if (dr["Description"].ToString() == pid)
                {
                    IsExist = true;
                    break;
                }
            }
            if (IsExist)
            {
                lbMsg.Text = "你选择的商品已经存在，请修改数量。";//可以设置成自动添加数量
            }
            else
            {
                DataTable myCartRow = Product.getProductInfoById(pid);
                //把商品信息加到mydt
                DataRow dr = mydt.NewRow();
                dr["Description"] = myCartRow.Rows[0]["Description"];
                dr["ImgUrl1"] = myCartRow.Rows[0]["ImgUrl1"];
                dr["UnitPrice"] = myCartRow.Rows[0]["UnitPrice"];
                dr["Amount"] = "1";
                mydt.Rows.Add(dr);
            }
        }
        GridView1.DataSource = mydt;
        GridView1.DataBind();
        Session["Cart"] = mydt;
    }


    protected void GridView1_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)//先判断是否是数据行
        {
            //鼠标效果
            e.Row.Attributes.Add("onmouseover", "oldBG=this.style.backgroundColor;this.style.backgroundColor='#elecee'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=oldBG");
            //给加减号图片增加客户端事件，修改文本框的内容
            TextBox tbx = (TextBox)e.Row.FindControl("TextBox1");//找到模板里的文本框
            tbx.Attributes.Add("onkeyup","CheckValue("+tbx.ClientID+");");
            ((HtmlImage)e.Row.FindControl("imgReduce")).Attributes.Add("onclick", "Reduce(" + tbx.ClientID + ");");//点击加号
            ((HtmlImage)e.Row.FindControl("imgAdd")).Attributes.Add("onclick", "Plus(" + tbx.ClientID + ");");//点击减号
            //计算总金额
            DataRowView drv = (DataRowView)e.Row.DataItem;
            total += Convert.ToDecimal(drv["UnitPrice"]) * Convert.ToInt32(drv["Amount"]);
            lbMsg.Text = "金额总计：" + total.ToString() + "元";

        }
    }

    protected void GridView1_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
    {
        //点击删除按钮时，删除当前行
        if (Session["Cart"] != null)
        {
            DataTable dt = (DataTable)Session["Cart"];
            dt.Rows.RemoveAt(e.RowIndex);
            dt.AcceptChanges();
            Session["Cart"] = dt;
            Response.Redirect("ShoppingCart.aspx");//?这句话是否起到刷新作用，没有会怎么样？
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        
        if (Session["Cart"] != null)
        {
            DataTable dt = (DataTable)Session["Cart"];
            for(int i = 0; i < GridView1.Rows.Count; i++)
            {
                dt.Rows[i]["Amount"] = ((TextBox)GridView1.Rows[i].FindControl("TextBox1")).Text;
            }
            dt.AcceptChanges();
            Session["Cart"] = dt;
            Response.Redirect("ShoppingCart.aspx");//?这句话是否起到刷新作用，没有会怎么样？
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("ConfirmOrder.aspx");
    }
}