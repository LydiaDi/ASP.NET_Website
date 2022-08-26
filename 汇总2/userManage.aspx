<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="userManage.aspx.cs" Inherits="_180808.userManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StyleSheets/userManager.css" type="text/css" rel="Stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div id="top">
    <asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick">
        <Items>
            <asp:MenuItem Text="个人中心" Value="1"></asp:MenuItem>
            <asp:MenuItem Text="进行操作" Value="2"></asp:MenuItem>
        </Items>
    </asp:Menu>
    </div>

    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

        <asp:View ID="View1" runat="server"></asp:View>
        <asp:View ID="View2" runat="server">

    <div id="table">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="20">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="UserID" HeaderText="用户账号" SortExpression="UserID" ReadOnly="True" />
                <asp:BoundField DataField="Level" HeaderText="等级" SortExpression="Level" />
                <asp:BoundField DataField="UserName" HeaderText="用户名" SortExpression="UserName" ReadOnly="True" />
                <asp:BoundField DataField="Postcode" HeaderText="密码" SortExpression="Postcode" ReadOnly="True" />
                <asp:BoundField DataField="RegDate" HeaderText="注册时间" SortExpression="RegDate" ReadOnly="True" />
                <asp:BoundField DataField="RegIP" HeaderText="注册时的IP地址" SortExpression="RegIP" ReadOnly="True" />
                <asp:BoundField DataField="LastLoginDate" HeaderText="上次登录时间" SortExpression="LastLoginDate" ReadOnly="True" />
                <asp:BoundField DataField="LastLoginIP" HeaderText="上次登录时的IP地址" SortExpression="LastLoginIP" ReadOnly="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" DeleteCommand="DELETE FROM [USER_INFO] WHERE [UserID] = @UserID" InsertCommand="INSERT INTO [USER_INFO] ([Level], [UserName], [Password], [Email], [ImageUrl], [Province], [City], [Address], [Postcode], [UserRole], [Telephone], [RegDate], [RegIP], [LastLoginDate], [LastLoginIP]) VALUES (@Level, @UserName, @Password, @Email, @ImageUrl, @Province, @City, @Address, @Postcode, @UserRole, @Telephone, @RegDate, @RegIP, @LastLoginDate, @LastLoginIP)" SelectCommand="SELECT * FROM [USER_INFO]" UpdateCommand="UPDATE [USER_INFO] SET [Level] = @Level, [UserName] = @UserName, [Password] = @Password, [Email] = @Email, [ImageUrl] = @ImageUrl, [Province] = @Province, [City] = @City, [Address] = @Address, [Postcode] = @Postcode, [UserRole] = @UserRole, [Telephone] = @Telephone, [RegDate] = @RegDate, [RegIP] = @RegIP, [LastLoginDate] = @LastLoginDate, [LastLoginIP] = @LastLoginIP WHERE [UserID] = @UserID">
            <DeleteParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Level" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="ImageUrl" Type="String" />
                <asp:Parameter Name="Province" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Postcode" Type="String" />
                <asp:Parameter Name="UserRole" Type="String" />
                <asp:Parameter Name="Telephone" Type="String" />
                <asp:Parameter Name="RegDate" Type="String" />
                <asp:Parameter Name="RegIP" Type="String" />
                <asp:Parameter Name="LastLoginDate" Type="String" />
                <asp:Parameter Name="LastLoginIP" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Level" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="ImageUrl" Type="String" />
                <asp:Parameter Name="Province" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Postcode" Type="String" />
                <asp:Parameter Name="UserRole" Type="String" />
                <asp:Parameter Name="Telephone" Type="String" />
                <asp:Parameter Name="RegDate" Type="String" />
                <asp:Parameter Name="RegIP" Type="String" />
                <asp:Parameter Name="LastLoginDate" Type="String" />
                <asp:Parameter Name="LastLoginIP" Type="String" />
                <asp:Parameter Name="UserID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
       </div>

            </asp:View>

    </asp:MultiView>
</asp:Content>
