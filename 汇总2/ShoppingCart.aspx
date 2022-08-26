<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <style type="text/css">       
        .shopping
        {
            text-align:center;
           
            }
    </style>
    <script type="text/javascript">
        //在客户端实现对象加1的操作(为什么不用点击图片实现某一函数的操作？为什么在服务器端添加客户端事件属性？)
        function Plus(obj) {
            obj.value = parseInt(obj.value) + 1;
        }
        //对象值减1
        function Reduce(obj) {
            if (obj.value > 1)
                obj.value = parseInt(obj.value) - 1;
        }
        //替换非整数输入
        function CheckValue(obj) {
            var v = obj.value.replace(/[^\d]/g, '');
            if (v == '' || v == NaN) {
                obj.value = '1';
            }
            else {
                obj.value = v;
            }
        }
    </script>
</head>
<body >
    <form id="form1" runat="server">
        <div class="shopping">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                ShowFooter="True" OnRowDataBound="GridView1_RowDataBound" 
                OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Height="222px" Width="639px" style="margin-top: 17px" >
                <Columns>
                    <asp:TemplateField>
                        <FooterTemplate>
                            <asp:Button ID="Button1" runat="server" Text="删除所选" />
                        </FooterTemplate>
                        <HeaderTemplate>
                            <asp:CheckBox ID="CheckBox2" runat="server" Text="全选" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="选择" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="商品名称" DataField="Description" />
                    <asp:ImageField DataImageUrlField="ImgUrl1" HeaderText="商品图片">
                        <ControlStyle BackColor="#DAE9E9" Height="60px" Width="60px" />
                    </asp:ImageField>
                    <asp:BoundField HeaderText="单价" DataField="UnitPrice" />
                    <asp:TemplateField HeaderText="数量">
                        <FooterTemplate>
                            <asp:Label ID="Label1" runat="server" Text="总计"></asp:Label>
                        </FooterTemplate>
                        <ItemTemplate>
                            <img src="img/minus.gif" alt="减少一个" runat="server" id="imgReduce" height="15" width="15" />
                            <asp:TextBox ID="TextBox1" runat="server" Height="18px" Width="18px" Text='<%# Eval("Amount") %>'></asp:TextBox>
                            <img src="img/plus.gif" alt="增加一个" runat="server" id="imgAdd" height="15" width="15"/>
                        </ItemTemplate>
                        <ControlStyle Height="10px" Width="10px" />
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                </Columns>
                <EmptyDataTemplate>
                    购物车里还没有商品，<asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="index.aspx">去购物</asp:LinkButton>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>

        <div>
            <asp:Label ID="lbMsg" runat="server"></asp:Label>
            <br />
           
            <asp:Button ID="Button3" runat="server" Text="刷新数据" OnClick="Button3_Click" Width="100px" Height="30px" />
            <asp:Button ID="Button2" runat="server" Text="继续购物" onclick="Button2_Click" Width="100px" Height="30px" />
            <asp:Button ID="Button4" runat="server" Text="去结算" Width="100px" Height="30px" OnClick="Button4_Click" />
        </div>
    </form>
</body>
</html>
