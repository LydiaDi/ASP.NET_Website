<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="_180808.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StyleSheets/login.css" type="text/css" rel="Stylesheet" />
    <title>登录</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login_container">
        <div class="login_a">
            <asp:Label ID="Label3" runat="server" Text="登   陆" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
         </div>

        <div class="menu">
        <asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick" Orientation="Horizontal">
            <DynamicMenuItemStyle Height="30px" Width="50px" />
            <Items>
                <asp:MenuItem Text="用户" Value="1"></asp:MenuItem>
                <asp:MenuItem Text="管理员" Value="2"></asp:MenuItem>
            </Items>
            <LevelMenuItemStyles>
                <asp:MenuItemStyle BorderStyle="None" Font-Size="Larger" Font-Underline="False" ForeColor="#AABBCD" />
            </LevelMenuItemStyles>
            <StaticSelectedStyle Font-Size="Larger" ForeColor="Black" Height="30px" Width="50px"  />
        </asp:Menu>
        </div>

        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <div style="height: 45px; width: 320px;margin-top:20px;margin-left:40px;">
                <asp:Label ID="Label1" runat="server" Text="用户名:" ></asp:Label>&nbsp;
                <asp:TextBox ID="txtUserName" runat="server" AutoPostBack="False" Height="34px" Width="200px"></asp:TextBox>
                </div>

                <div style="height: 45px; width: 320px;margin-top:20px; margin-left:40px;">
                    <asp:Label ID="Label2" runat="server" Text="密码:" ></asp:Label>&nbsp;&nbsp;
                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Height="34px" Width="200px"></asp:TextBox>
                </div>

                <div style="height: 45px; width: 320px;margin-top:20px;margin-left:40px;">
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="  是否记录用户信息"  />
                </div>
                <div style="height: 45px; width: 320px;margin-left:130px;">
                    <asp:Button ID="Button1" runat="server" Text="登录" OnClick="Button1_Click"  Height="36px" Width="92px" BackColor="#B4A078" Font-Size="Medium" ForeColor="White" />
                </div>
                <div style="height: 45px; width: 320px;margin-left:40px;">
                    <br /><br />
                    <asp:Label ID="lbMsg" runat="server" Font-Bold="True"></asp:Label>
                </div>

            </asp:View>

            <asp:View ID="View2" runat="server">
            <div class="view2">
                
               <div class="view2_right">
               <div style="height: 45px; width: 320px;margin-top:20px;margin-left:40px;">
                    <asp:Label ID="Label5" runat="server" Text="账号:" ></asp:Label>&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="False" Height="34px" Width="200px"></asp:TextBox>
               </div>
                <div style="height: 45px; width: 320px;margin-top:20px; margin-left:40px;">
                    <asp:Label ID="Label6" runat="server" Text="密码:" ></asp:Label>&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Height="34px" Width="200px"></asp:TextBox>
                </div>
                </div>
                
                <div class="Rdblist">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="150px" Width="130px" AutoPostBack="True">
                    <asp:ListItem Value="用户管理员">用户管理员</asp:ListItem>
                    <asp:ListItem Value="商品管理员">商品管理员</asp:ListItem>
                    <asp:ListItem Value="订单管理员">订单管理员</asp:ListItem>
                    <asp:ListItem Value="支付管理员">支付管理员</asp:ListItem>
                    <asp:ListItem Value="配送管理员">配送管理员</asp:ListItem>
                    <asp:ListItem Value="全局管理员">全局管理员</asp:ListItem>
                </asp:RadioButtonList>
                </div>

                <div class="view2_bottom">
                <div style="height: 45px; width: 320px;margin-top:20px;margin-left:40px;">
                    <asp:CheckBox ID="CheckBox2" runat="server" Text="  是否记录用户信息"  />
                </div>
                <div style="height: 45px; width: 320px;margin-left:130px;">
                    <asp:Button ID="Button2" runat="server" Text="登录" OnClick="Button2_Click"  Height="36px" Width="92px" BackColor="#B4A078" Font-Size="Medium" ForeColor="White" />
                </div>
                <div style="height: 45px; width: 320px;margin-left:40px;">
                    
                    <br /><br />
                    <asp:Label ID="Label8" runat="server" Font-Bold="True"></asp:Label>
                </div>
                </div>
           </div>
           </asp:View>

        </asp:MultiView>
        </div>
</asp:Content>
