<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProductManager.aspx.cs" Inherits="_180808.ProductManager" %>
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

        <asp:View ID="View1" runat="server">
            <div style="font-size: 28px; line-height: 28px; text-indent: 2em; color: #BB915D;">            
            <asp:Label ID="Label2" runat="server" Text="欢迎进入订单管理员页面，请您进行操作"></asp:Label>
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <div id="table">
            <asp:Label ID="Label1" runat="server" Text="请选择产品类别" Font-Size="XX-Large" Font-Bold="True" ForeColor="Black"></asp:Label>
            &nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="40px" Width="160px" Font-Size="XX-Large" Font-Bold="True" BackColor="White" ForeColor="Black" DataSourceID="SqlDataSource1" DataTextField="ProductClass" DataValueField="ProductClassID"></asp:DropDownList>
            
            

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" SelectCommand="SELECT * FROM [CLASS_INFO]"></asp:SqlDataSource>
            
            

    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ProductClass" HeaderText="商品类别" SortExpression="ProductClass" />
                <asp:BoundField DataField="ImgUrl1" HeaderText="商品图片" SortExpression="ImgUrl1" />
                <asp:BoundField DataField="OtherDescription" HeaderText="产品描述" SortExpression="OtherDescription" />
                <asp:BoundField DataField="UnitPrice" HeaderText="价格" SortExpression="UnitPrice" />
                <asp:BoundField DataField="ProductClassID" HeaderText="商品类别编号" SortExpression="ProductClassID" />
                <asp:HyperLinkField DataTextField="Description" DataNavigateUrlFields="ProductID,ProductClassID" DataNavigateUrlFormatString="ProductDetails.aspx?pid={0}&amp;cid={1}" />
            </Columns>
        </asp:GridView>
        
        
        
       
        
        
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" DeleteCommand="DELETE FROM [PRODUCT_INFO] WHERE [ProductID] = @ProductID" InsertCommand="INSERT INTO [PRODUCT_INFO] ([ProductClass], [ImgUrl1], [ImgUrl2], [ImgUrl3], [ImgUrl4], [ImgUrl5], [Description], [OtherDescription], [UnitPrice], [ProductClassID]) VALUES (@ProductClass, @ImgUrl1, @ImgUrl2, @ImgUrl3, @ImgUrl4, @ImgUrl5, @Description, @OtherDescription, @UnitPrice, @ProductClassID)" SelectCommand="SELECT * FROM [PRODUCT_INFO] WHERE ([ProductClassID] = @ProductClassID)" UpdateCommand="UPDATE [PRODUCT_INFO] SET [ProductClass] = @ProductClass, [ImgUrl1] = @ImgUrl1, [ImgUrl2] = @ImgUrl2, [ImgUrl3] = @ImgUrl3, [ImgUrl4] = @ImgUrl4, [ImgUrl5] = @ImgUrl5, [Description] = @Description, [OtherDescription] = @OtherDescription, [UnitPrice] = @UnitPrice, [ProductClassID] = @ProductClassID WHERE [ProductID] = @ProductID">
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
                <asp:ControlParameter ControlID="DropDownList1" Name="ProductClassID" PropertyName="SelectedValue" Type="String" />
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

            </div>


        </asp:View>

    </asp:MultiView>

            
</asp:Content>
