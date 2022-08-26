<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="payManager.aspx.cs" Inherits="_180808.payManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StyleSheets/allManager.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="top_pay">
    <asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick">
        <Items>
            <asp:MenuItem Text="个人中心" Value="1"></asp:MenuItem>
            <asp:MenuItem Text="进行操作" Value="2"></asp:MenuItem>
        </Items>
        <LevelMenuItemStyles>
                <asp:MenuItemStyle Font-Underline="False" ForeColor="Black" />
       </LevelMenuItemStyles>
            <LevelSelectedStyles>
                <asp:MenuItemStyle BorderColor="#CC0000" Font-Underline="False" />
            </LevelSelectedStyles>
            <StaticHoverStyle BorderColor="#CC9756" Font-Bold="True" Font-Italic="False" Font-Size="Larger" ForeColor="#CC9756" />
            <StaticMenuItemStyle Font-Size="Larger" Height="30px" Width="140px" ForeColor="Black" />
            <StaticSelectedStyle Font-Bold="True" Font-Size="Larger" ForeColor="#CC9756" />
    </asp:Menu>
    </div>

    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

        <asp:View ID="View1" runat="server">
        <div id="view1_a">
                <div id="view1_b">
                    <asp:Label ID="Label3" runat="server" Text="尊敬的管理员，您好！" Font-Bold="True" Font-Size="X-Large"></asp:Label>
            
             </div>

           <div id="view1_c">
            <br />
             <br />
               <asp:Label ID="Label4" runat="server" Text="管理员类型："></asp:Label>
               <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
               <br />
               <asp:Label ID="Label6" runat="server" Text="登录名："></asp:Label>
               <asp:Label ID="Label7" runat="server" Text=""></asp:Label>
             </div>
            </div>
        </asp:View>

        <asp:View ID="View2" runat="server">
            <div id="table_pay">

             <div id="table_top_pay">
            <asp:Label ID="Label1" runat="server" Text="选择订单状态:" Font-Size="Large"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="OrderStatusClass" DataValueField="OrderStatus" AutoPostBack="True" Font-Size="Large"></asp:DropDownList>
            </div>

                

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" SelectCommand="SELECT * FROM [ORDER_STATUS]"></asp:SqlDataSource>
            
            <div id="table_bottom_pay">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID,OrderStatusID" DataSourceID="SqlDataSource2" AllowSorting="True">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="更新" 
                                onclientclick="return confirm(&quot;您确定更新吗？&quot;)"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            &nbsp;&nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Delete" Text="删除" 
                                onclientclick="return confirm(&quot;您确定删除吗？&quot;)"></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="95px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="OrderID" HeaderText="订单ID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" >
                    <ItemStyle Width="90px" />
                        <ItemStyle Width="80px" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OrderStatusClass" HeaderText="订单状态" SortExpression="OrderStatusClass" >
                    <ItemStyle Width="90px" />
                        <ItemStyle Width="80px" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OrderStatus" HeaderText="订单状态码" SortExpression="OrderStatus" >
                    <ItemStyle Width="90px" />
                        <ItemStyle Width="80px" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="UserID" HeaderText="用户ID" SortExpression="UserID" ReadOnly="True" >
                    <ItemStyle Width="90px" />
                        <ItemStyle Width="80px" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PaymentMode" HeaderText="支付方式" SortExpression="PaymentMode" ReadOnly="True" >
                    <ItemStyle Width="90px" />
                        <ItemStyle Width="80px" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TotalOrder" HeaderText="订单总额" SortExpression="TotalOrder" ReadOnly="True" >
                    <ItemStyle Width="90px" />
                        <ItemStyle Width="80px" HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" SelectCommand="SELECT * FROM(SELECT *FROM [ORDER_INFO] WHERE ([OrderStatus] = @OrderStatus))AS PRO,[ORDER_STATUS] WHERE
[PRO].OrderStatus=[ORDER_STATUS].OrderStatus" DeleteCommand="DELETE FROM [ORDER_INFO] WHERE [OrderID] = @OrderID" InsertCommand="INSERT INTO [ORDER_INFO] ([UserID], [OrderDate], [OrderStatus], [PaymentMode], [ShippingMode], [Carrier], [TrackingNumber], [TotalOrder], [ExpressFee], [ExpressStatus], [Location]) VALUES (@UserID, @OrderDate, @OrderStatus, @PaymentMode, @ShippingMode, @Carrier, @TrackingNumber, @TotalOrder, @ExpressFee, @ExpressStatus, @Location)" UpdateCommand="UPDATE [ORDER_INFO] SET [UserID] = @UserID, [OrderDate] = @OrderDate, [OrderStatus] = @OrderStatus, [PaymentMode] = @PaymentMode, [ShippingMode] = @ShippingMode, [Carrier] = @Carrier, [TrackingNumber] = @TrackingNumber, [TotalOrder] = @TotalOrder, [ExpressFee] = @ExpressFee, [ExpressStatus] = @ExpressStatus, [Location] = @Location WHERE [OrderID] = @OrderID">
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
                    <asp:Parameter Name="ExpressStatus" Type="String" />
                    <asp:Parameter Name="Location" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="OrderStatus" PropertyName="SelectedValue" />
                </SelectParameters>
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
                    <asp:Parameter Name="ExpressStatus" Type="String" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter Name="OrderID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
        </div>
        </asp:View>

    </asp:MultiView>
</asp:Content>
