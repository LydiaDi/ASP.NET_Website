<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConfirmOrder.aspx.cs" Inherits="ConfirmOrder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
        <form id="form1" runat="server">
    <h3>订单信息确认</h3>
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField HeaderText="商品名称" DataField="Description" />
                <asp:ImageField HeaderText="商品图片" DataImageUrlField="ImgUrl1">
                    <ControlStyle Height="50px" Width="50px" />
                </asp:ImageField>
                <asp:BoundField HeaderText="单价" DataField="UnitPrice" />
                <asp:BoundField HeaderText="数量" DataField="Amount" />
            </Columns>
        </asp:GridView>
        
    </div>
    <div>
    </div>
    <asp:Button ID="btnOrder" runat="server" Text="提交订单" onclick="btnOrder_Click" />
    <asp:Button ID="btnBack" runat="server" Text="返回购物车" />
    <asp:Label ID="IbMsg" runat="server"></asp:Label>
    <asp:Label ID="IbToPay" runat="server" Text="正在跳转到支付页面..." Visible="False"></asp:Label>
    <div>
    </div>
    </form>
</body>
</html>
