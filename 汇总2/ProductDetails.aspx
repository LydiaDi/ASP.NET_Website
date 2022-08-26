<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="_180808.ProductDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="ProductID" DataSourceID="SqlDataSource1">
                <Fields>
                    <asp:BoundField DataField="ProductClass" HeaderText="ProductClass" SortExpression="ProductClass" />
                    <asp:BoundField DataField="ImgUrl1" HeaderText="ImgUrl1" SortExpression="ImgUrl1" />
                    <asp:BoundField DataField="ImgUrl2" HeaderText="ImgUrl2" SortExpression="ImgUrl2" />
                    <asp:BoundField DataField="ImgUrl3" HeaderText="ImgUrl3" SortExpression="ImgUrl3" />
                    <asp:BoundField DataField="ImgUrl4" HeaderText="ImgUrl4" SortExpression="ImgUrl4" />
                    <asp:BoundField DataField="ImgUrl5" HeaderText="ImgUrl5" SortExpression="ImgUrl5" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="OtherDescription" HeaderText="OtherDescription" SortExpression="OtherDescription" />
                    <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                    <asp:BoundField DataField="ProductClassID" HeaderText="ProductClassID" SortExpression="ProductClassID" />
                    <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" SelectCommand="SELECT * FROM [PRODUCT_INFO] WHERE (([ProductClassID] = @ProductClassID) AND ([ProductID] = @ProductID))" DeleteCommand="DELETE FROM [PRODUCT_INFO] WHERE [ProductID] = @ProductID" InsertCommand="INSERT INTO [PRODUCT_INFO] ([ProductClass], [ImgUrl1], [ImgUrl2], [ImgUrl3], [ImgUrl4], [ImgUrl5], [Description], [OtherDescription], [UnitPrice], [ProductClassID]) VALUES (@ProductClass, @ImgUrl1, @ImgUrl2, @ImgUrl3, @ImgUrl4, @ImgUrl5, @Description, @OtherDescription, @UnitPrice, @ProductClassID)" UpdateCommand="UPDATE [PRODUCT_INFO] SET [ProductClass] = @ProductClass, [ImgUrl1] = @ImgUrl1, [ImgUrl2] = @ImgUrl2, [ImgUrl3] = @ImgUrl3, [ImgUrl4] = @ImgUrl4, [ImgUrl5] = @ImgUrl5, [Description] = @Description, [OtherDescription] = @OtherDescription, [UnitPrice] = @UnitPrice, [ProductClassID] = @ProductClassID WHERE [ProductID] = @ProductID">
                <DeleteParameters>
                    <asp:Parameter Name="ProductID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductClass" Type="String" />
                    <asp:Parameter Name="ImgUrl1" Type="String" />
                    <asp:Parameter Name="ImgUrl2" Type="String" />
                    <asp:Parameter Name="ImgUrl3" Type="String" />
                    <asp:Parameter Name="ImgUrl4" Type="String" />
                    <asp:Parameter Name="ImgUrl5" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="OtherDescription" Type="String" />
                    <asp:Parameter Name="UnitPrice" Type="Decimal" />
                    <asp:Parameter Name="ProductClassID" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="ProductClassID" QueryStringField="cid" Type="String" />
                    <asp:QueryStringParameter Name="ProductID" QueryStringField="pid" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProductClass" Type="String" />
                    <asp:Parameter Name="ImgUrl1" Type="String" />
                    <asp:Parameter Name="ImgUrl2" Type="String" />
                    <asp:Parameter Name="ImgUrl3" Type="String" />
                    <asp:Parameter Name="ImgUrl4" Type="String" />
                    <asp:Parameter Name="ImgUrl5" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="OtherDescription" Type="String" />
                    <asp:Parameter Name="UnitPrice" Type="Decimal" />
                    <asp:Parameter Name="ProductClassID" Type="String" />
                    <asp:Parameter Name="ProductID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
