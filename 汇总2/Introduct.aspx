<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Introduct.aspx.cs" Inherits="Introduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="StyleSheets/index.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="introduct">
   
    <asp:Label ID="Label2" runat="server" Text="logo介绍:" Font-Size="XX-Large" Font-Bold="True"></asp:Label>
    <br />
   &nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" Text="本购物网站名称为“like有”，中文名为“立刻有”，希望通过名称使用户对网站的认知是“在这里，你可以快速得到想要的商品”。“like”一词既是“立刻”的汉语拼音，也是“喜欢”一词的英文，“立刻有”的汉语拼音刚好是li ke you，翻译过来变成中文，即为喜欢你。传达出本网站的一种积极向上、给人温暖的态度，为用户打造极致的购物体验。" Font-Size="Large"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="投放广告" Font-Size="X-Large" ForeColor="#CC0000"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text="商铺入驻" Font-Size="X-Large"  ForeColor="#CC0000"></asp:Label>
    </div>
</asp:Content>

