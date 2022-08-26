<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="orderManager.aspx.cs" Inherits="_180808.orderManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StyleSheets/orderManager.css" type="text/css" rel="Stylesheet" />
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
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" >

        <asp:View ID="View1" runat="server"></asp:View>
        <asp:View ID="View2" runat="server">

    <div id="table">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" PageSize="15">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
            <asp:BoundField DataField="OrderStatus" HeaderText="OrderStatus" SortExpression="OrderStatus" />
            <asp:BoundField DataField="PaymentMode" HeaderText="PaymentMode" SortExpression="PaymentMode" />
            <asp:BoundField DataField="ShippingMode" HeaderText="ShippingMode" SortExpression="ShippingMode" />
            <asp:BoundField DataField="Carrier" HeaderText="Carrier" SortExpression="Carrier" />
            <asp:BoundField DataField="TrackingNumber" HeaderText="TrackingNumber" SortExpression="TrackingNumber" />
            <asp:BoundField DataField="TotalOrder" HeaderText="TotalOrder" SortExpression="TotalOrder" />
            <asp:BoundField DataField="ExpressFee" HeaderText="ExpressFee" SortExpression="ExpressFee" />
            <asp:HyperLinkField DataNavigateUrlFields="OrderID" DataNavigateUrlFormatString="orderDetiles.aspx?oid={0}" DataTextField="OrderID" HeaderText="OrderID" />
        </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" DeleteCommand="DELETE FROM [ORDER_INFO] WHERE [OrderID] = @OrderID" InsertCommand="INSERT INTO [ORDER_INFO] ([UserID], [OrderDate], [OrderStatus], [PaymentMode], [ShippingMode], [Carrier], [TrackingNumber], [TotalOrder], [ExpressFee]) VALUES (@UserID, @OrderDate, @OrderStatus, @PaymentMode, @ShippingMode, @Carrier, @TrackingNumber, @TotalOrder, @ExpressFee)" SelectCommand="SELECT * FROM [ORDER_INFO]" UpdateCommand="UPDATE [ORDER_INFO] SET [UserID] = @UserID, [OrderDate] = @OrderDate, [OrderStatus] = @OrderStatus, [PaymentMode] = @PaymentMode, [ShippingMode] = @ShippingMode, [Carrier] = @Carrier, [TrackingNumber] = @TrackingNumber, [TotalOrder] = @TotalOrder, [ExpressFee] = @ExpressFee WHERE [OrderID] = @OrderID">
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserID" Type="String" />
                <asp:Parameter Name="OrderDate" Type="String" />
                <asp:Parameter Name="OrderStatus" Type="String" />
                <asp:Parameter Name="PaymentMode" Type="String" />
                <asp:Parameter Name="ShippingMode" Type="String" />
                <asp:Parameter Name="Carrier" Type="String" />
                <asp:Parameter Name="TrackingNumber" Type="String" />
                <asp:Parameter Name="TotalOrder" Type="String" />
                <asp:Parameter Name="ExpressFee" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserID" Type="String" />
                <asp:Parameter Name="OrderDate" Type="String" />
                <asp:Parameter Name="OrderStatus" Type="String" />
                <asp:Parameter Name="PaymentMode" Type="String" />
                <asp:Parameter Name="ShippingMode" Type="String" />
                <asp:Parameter Name="Carrier" Type="String" />
                <asp:Parameter Name="TrackingNumber" Type="String" />
                <asp:Parameter Name="TotalOrder" Type="String" />
                <asp:Parameter Name="ExpressFee" Type="String" />
                <asp:Parameter Name="OrderID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
            </asp:View>

    </asp:MultiView>
</asp:Content>
