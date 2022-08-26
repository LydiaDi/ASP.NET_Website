<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="_180808.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StyleSheets/register.css" type="text/css" rel="Stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="register_container">
        <div style="height: 45px; width: 225px; clear:both">
            <asp:TextBox ID="txtUserName" runat="server" Height="34px" Width="280px" ></asp:TextBox>
        </div>
        <div style="height: 45px; width: 225px">
            <asp:TextBox ID="txtPwd" runat="server" Height="34px" Width="280px"  ></asp:TextBox>
        </div>
        <div style="height: 45px; width: 225px">
            <asp:TextBox ID="txtPwd2" runat="server" Height="34px" Width="280px"></asp:TextBox>
        </div>
        <div style="height: 45px; width: 225px">
            <asp:TextBox ID="txtEmail" runat="server" Height="34px" Width="280px"></asp:TextBox>
        </div>
        <div style="height: 45px; width: 225px">
            <asp:TextBox ID="txtTel" runat="server" Height="34px" Width="280px"></asp:TextBox>        
        </div>
        <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnReg" runat="server" Text="注册" OnClick="btnReg_Click" BackColor="#B4A078" BorderColor="White" Height="36px" Width="92px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="重置" OnClick="Button2_Click" BackColor="#B4A078" BorderColor="White" Height="36px" Width="92px"/>
        </div>
        <div>
            <br />
            <asp:Label ID="lbMsg" runat="server"></asp:Label>
        </div>
    </div>

</asp:Content>
