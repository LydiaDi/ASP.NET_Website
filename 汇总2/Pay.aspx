<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeFile="Pay.aspx.cs" Inherits="Pay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <link href="StyleSheets/Pay.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="d1">
&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RadioButton ID="RadioButton1" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Image ID="Image1" runat="server" ImageUrl="~/img/a2.PNG" Height="100px" 
        Width="140px" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
         <asp:RadioButton ID="RadioButton2" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Image ID="Image2" runat="server" ImageUrl="~/img/a1.PNG" Height="100px" 
        Width="140px" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
         <asp:RadioButton ID="RadioButton3" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Image ID="Image3" runat="server" ImageUrl="~/img/a4.PNG" Height="100px" 
        Width="140px" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
         <asp:RadioButton ID="RadioButton4" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Image ID="Image4" runat="server" ImageUrl="~/img/a3.PNG" Height="100px" 
        Width="140px" />
        <br />
         <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <div class="d2">
    <asp:Button ID="Button1" runat="server" Text="确认支付" Font-Size="X-Large" /></div>
</div>
</asp:Content>

