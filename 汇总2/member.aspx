<%@ Page Language="C#" AutoEventWireup="true" CodeFile="member.aspx.cs" Inherits="member" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheets/member.css" type="text/css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="a">
    <div class="title">
        <asp:HyperLink ID="HyperLink4" runat="server" ForeColor="White" NavigateUrl="index.aspx" Font-Underline="False">首页 | </asp:HyperLink>
        <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="White" NavigateUrl="index.aspx" Font-Underline="False">前往购物 | </asp:HyperLink>
        <asp:HyperLink ID="HyperLink6" runat="server" ForeColor="White" NavigateUrl="ShoppingCart.aspx" Font-Underline="False">查看购物车 | </asp:HyperLink>
        <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="White" NavigateUrl="register.aspx" Font-Underline="False">注册 | </asp:HyperLink>
        
    </div>
    </div>

    <div class="banner">
    <div class="logo">

    </div>
    <div class="b">
    </div>
    </div>

    <div class="member_container">
    <div class="left">
        <asp:Label ID="Label1" runat="server" Text="账号管理" Font-Bold="True" Font-Size="Large"></asp:Label>
        <br /><br />
        <asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick">
            <Items>
                <asp:MenuItem Text="个人中心" Value="个人中心"></asp:MenuItem>
                <asp:MenuItem Text="消息通知" Value="消息通知"></asp:MenuItem>
                <asp:MenuItem Text="账号信息" Value="账号信息"></asp:MenuItem>
            </Items>
            <LevelMenuItemStyles>
                <asp:MenuItemStyle Font-Underline="False" ForeColor="Black" />
            </LevelMenuItemStyles>
            <LevelSelectedStyles>
                <asp:MenuItemStyle BorderColor="#CC0000" Font-Underline="False" />
            </LevelSelectedStyles>
            <StaticHoverStyle BorderColor="#CC9756" Font-Bold="True" Font-Italic="False" Font-Size="Large" ForeColor="#CC9756" />
            <StaticMenuItemStyle Font-Size="Large" Height="30px" Width="140px" ForeColor="Black" />
            <StaticSelectedStyle Font-Bold="True" Font-Size="Large" ForeColor="#CC9756" />
        </asp:Menu>
   </div>

    <div class="right">
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">

                <div class="view1_left">
                    <asp:Image ID="Image1" runat="server" />
                    <asp:Label ID="Label10" runat="server" Text="尊敬的用户您好"></asp:Label><br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="index.aspx">前往购物</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="ShoppingCart.aspx">查看购物车</asp:HyperLink>
                
                   </div>
                    

                <div class="view1_right">
                    <asp:Label ID="Label11" runat="server" Text="欢迎回到个人中心~"></asp:Label>
                    <asp:Label ID="Label12" runat="server" Text=""></asp:Label>
                    <br />

                    <asp:Label ID="Label13" runat="server" Text="收货地址："></asp:Label>
                    <asp:Label ID="Label14" runat="server" Text="天津师范大学主校区"></asp:Label>
                    <br />

                    <asp:Label ID="Label15" runat="server" Text="个人等级："></asp:Label>
                    <asp:Label ID="Label16" runat="server" Text="10级"></asp:Label>
                    <br />
                    <asp:Label ID="Label17" runat="server" Text="钱包余额："></asp:Label>
                    <asp:Label ID="Label18" runat="server" Text="00.00"></asp:Label>
                    <br />
                    <asp:Label ID="Label21" runat="server" Text="待发货："></asp:Label>
                    <asp:Label ID="Label22" runat="server" Text="2"></asp:Label>
                    <br />
                    <asp:Label ID="Label23" runat="server" Text="待收货："></asp:Label>
                    <asp:Label ID="Label24" runat="server" Text="2"></asp:Label>
                    <br />
                    <asp:Label ID="Label25" runat="server" Text="评价："></asp:Label>
                    <asp:Label ID="Label26" runat="server" Text="5"></asp:Label>
                    <br />
                </div>
            </asp:View>

            <asp:View ID="View2" runat="server">尊敬的用户您好，您还没有任何消息哦~</asp:View>

            <asp:View ID="View3" runat="server">
            <div class="view3">

            <div>
                <div style="height: 45px; width: 80px;padding-top:30px;margin-right:30px; margin-left:30px;float:left;">
                <asp:Label ID="Label8" runat="server" Text="用户头像"></asp:Label>
                </div>
                <asp:Image ID="Image2" runat="server" Height="100px" Width="100px" ImageUrl="img/1.png" />
                <asp:FileUpload ID="FileUpload1" runat="server" Width="166px"  Height="25px"/>
                <asp:Button ID="Button1" runat="server" Text="上传头像" onclick="Button1_Click" Height="25px" Width="60px" />
                <asp:Label ID="Label5" runat="server"></asp:Label>
            </div>

            <div style="height: 20px; width: 80px;padding-top:30px;margin-right:30px; margin-left:30px;float:left;">
                <asp:Label ID="Label9" runat="server" Text="用户名"></asp:Label>
            </div>
            <div style="height: 20px; width: 400px;padding-top:30px;margin-right:30px; float:left;">
                 <asp:Label ID="lbUser" runat="server" Font-Size="Large"></asp:Label>
            </div>
            <div style="height: 20px; width: 80px;padding-top:30px;margin-right:30px; margin-left:30px;float:left;">
                <asp:Label ID="Label19" runat="server" Text="密码"></asp:Label>
            </div>

            <div style="height: 20px; width: 420px;padding-top:30px;margin-right:30px; margin-left:0px;float:left;">
                <asp:Label ID="Label20" runat="server" Text="***********"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" PasswordChar="true" Width="166px"  
                    Height="25px" ></asp:TextBox>
                <asp:Button ID="Button2" runat="server" Text="修改密码" onclick="Button2_Click" Height="25px" Width="60px"/>
                <asp:Label ID="Label6" runat="server"></asp:Label>
            </div>

            <div style="height: 20px; width: 80px;padding-top:30px;margin-right:30px; margin-left:30px;float:left;">
                <asp:Label ID="Label2" runat="server" Text="邮箱"></asp:Label>
            </div>
  
            <div style="height: 20px; width: 420px;padding-top:30px;margin-right:30px; margin-left:0px;float:left;">
                <asp:Label ID="lbEmail" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox2" runat="server" AutoPostBack="True" Width="166px"  Height="25px"></asp:TextBox>
                <asp:Button ID="Button3" runat="server" Text="点击修改" onclick="Button3_Click" Height="25px" Width="60px" />
                <asp:Label ID="Label4" runat="server"></asp:Label>
            </div>
        
            <div style="height: 20px; width: 80px;padding-top:30px;margin-right:30px; margin-left:30px;float:left;">
                <asp:Label ID="Label3" runat="server" Text="联系方式"></asp:Label>
            </div>

           <div style="height: 20px; width: 420px;padding-top:30px;margin-right:30px; margin-left:0px;float:left;">
                <asp:Label ID="lbTel" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox3" runat="server" Width="166px"  Height="25px"></asp:TextBox>
                <asp:Button ID="Button4" runat="server" Text="点击修改" onclick="Button4_Click" Height="25px" Width="60px" />
                <asp:Label ID="Label7" runat="server"></asp:Label>
           </div>
           </div>

           </asp:View>

        </asp:MultiView>
    </div>
    </div>
    </form>
</body>
</html>
