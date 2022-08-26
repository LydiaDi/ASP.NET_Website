<%@ Page Language="C#" AutoEventWireup="true" CodeFile="YHProductDetails.aspx.cs" Inherits="YHProductDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <style  type="text/css">
             *{
	margin:  0px;
	padding: 0;
}
     #message
 {
   
    width:400px;
    height:200px;
     font-family: 楷体; 
     font-size:18px;
     margin:50px auto;
     
    
     }
     #bottom
 {
   
    width:200px;
    height:200px;
     font-family: 楷体; 
     font-size:18px;
     margin:10px auto;
    
     }
     .cart  {width: 100px;
         height:20px;
    float:left;
                 margin-left: auto;
                 margin-right: auto;
                 margin-bottom: 0;
             }
                </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="message">
        <asp:DetailsView ID="DetailsView1" runat="server" Height="123px" Width="326px" 
            AutoGenerateRows="False" DataSourceID="SqlDataSource1">
            <Fields>
                <asp:BoundField DataField="Description" HeaderText="商品描述" 
                    SortExpression="Description" />
                <asp:BoundField DataField="ImgUrl1" HeaderText="商品图片" 
                    SortExpression="ImgUrl1" />
                <asp:BoundField DataField="ProductID" HeaderText="商品编号" 
                    SortExpression="ProductID" />
                <asp:BoundField DataField="OtherDescription" HeaderText="其他描述" 
                    SortExpression="OtherDescription" />
                <asp:BoundField DataField="UnitPrice" HeaderText="单价" 
                    SortExpression="UnitPrice" />
                <asp:BoundField DataField="ProductClass" HeaderText="商品类别" 
                    SortExpression="ProductClass" />
                <asp:BoundField DataField="ProductClassID" HeaderText="商品类别编号" 
                    SortExpression="ProductClassID" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" 
            SelectCommand="SELECT * FROM [PRODUCT_INFO] WHERE ([ProductID] = @ProductID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductID" QueryStringField="pid" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    <div id="bottom">
        <div class="cart">
            <asp:Button ID="Button1" runat="server" Text="加入购物车" onclick="Button1_Click" />
                    </div>
        <asp:Button ID="Button2" runat="server" Text="继续购物" PostBackUrl="index.aspx" />
    </div>
    </form>
</body>
</html>
