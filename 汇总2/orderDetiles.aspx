<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderDetiles.aspx.cs" Inherits="_180808.orderDetiles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DetailID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="DetailID" HeaderText="DetailID" InsertVisible="False" ReadOnly="True" SortExpression="DetailID" />
                    <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID" />
                    <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID" />
                    <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                    <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" DeleteCommand="DELETE FROM [ORDER_DETAIL] WHERE [DetailID] = @DetailID" InsertCommand="INSERT INTO [ORDER_DETAIL] ([OrderID], [ProductID], [UnitPrice], [Discount], [Amount]) VALUES (@OrderID, @ProductID, @UnitPrice, @Discount, @Amount)" SelectCommand="SELECT * FROM [ORDER_DETAIL] WHERE ([OrderID] = @OrderID)" UpdateCommand="UPDATE [ORDER_DETAIL] SET [OrderID] = @OrderID, [ProductID] = @ProductID, [UnitPrice] = @UnitPrice, [Discount] = @Discount, [Amount] = @Amount WHERE [DetailID] = @DetailID">
                <DeleteParameters>
                    <asp:Parameter Name="DetailID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="OrderID" Type="String" />
                    <asp:Parameter Name="ProductID" Type="String" />
                    <asp:Parameter Name="UnitPrice" Type="String" />
                    <asp:Parameter Name="Discount" Type="String" />
                    <asp:Parameter Name="Amount" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="OrderID" QueryStringField="oid" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="OrderID" Type="String" />
                    <asp:Parameter Name="ProductID" Type="String" />
                    <asp:Parameter Name="UnitPrice" Type="String" />
                    <asp:Parameter Name="Discount" Type="String" />
                    <asp:Parameter Name="Amount" Type="String" />
                    <asp:Parameter Name="DetailID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
