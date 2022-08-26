<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="deliveryManager.aspx.cs" Inherits="_180808.deliveryManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StyleSheets/allManager.css" type="text/css" rel="Stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="top_delivery">
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
            <div id="table_delivery">

                <div id="table_top_delivery">
                <asp:Label ID="Label1" runat="server" Text="选择发货状态：" Font-Size="Large"></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="ExpressStatusClass" DataValueField="ExpressStatus" Font-Size="Large"></asp:DropDownList>
                </div>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" SelectCommand="SELECT * FROM [EXPRESS_STATUS]"></asp:SqlDataSource>

                <div id="table_bottom_delivery">
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="SqlDataSource1">
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
                        

                        


                    <asp:TemplateField HeaderText="发货状态">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" 
                                    DataSourceID="SqlDataSource2" DataTextField="ExpressStatusClass" 
                                    DataValueField="ExpressStatus" SelectedValue='<%# Bind("ExpressStatus") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ExpressStatusClass") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="OrderID" HeaderText="订单号" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" >
                       <HeaderStyle Font-Underline="False" />
                        <ItemStyle Width="80px" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UserID" HeaderText="用户ID" SortExpression="UserID" >
                        <ItemStyle Width="90px" />
                            <ItemStyle Width="80px" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ShippingMode" HeaderText="运输方式" 
                            SortExpression="ShippingMode">
                        <ItemStyle Width="90px" />
                        <ItemStyle HorizontalAlign="Center" Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Carrier" HeaderText="物流公司" SortExpression="Carrier">
                        <ItemStyle Width="90px" />
                        <ItemStyle HorizontalAlign="Center" Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TrackingNumber" HeaderText="物流单号" 
                            SortExpression="TrackingNumber">
                        <ItemStyle Width="90px" />
                        <ItemStyle HorizontalAlign="Center" Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ExpressFee" HeaderText="运费" 
                            SortExpression="ExpressFee">
                        <ItemStyle Width="70px" />
                        <ItemStyle HorizontalAlign="Center" Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Location" HeaderText="快递位置" SortExpression="Location" ReadOnly="True" >
                        <ItemStyle Width="90px" />
                            <ItemStyle Width="80px" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField InsertVisible="False" ShowHeader="False">
                            <ItemTemplate>
                                &nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Text="提醒发货" />
                            </ItemTemplate>
                            <ItemStyle Width="90px" />
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                &nbsp;&nbsp;<asp:Button ID="Button3" runat="server" Text="联系快递公司" />
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </div>


                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" DeleteCommand="DELETE FROM [ORDER_INFO] WHERE [OrderID] = @OrderID" InsertCommand="INSERT INTO [ORDER_INFO] ([UserID], [OrderDate], [OrderStatus], [PaymentMode], [ShippingMode], [Carrier], [TrackingNumber], [TotalOrder], [ExpressFee], [ExpressStatus]) VALUES (@UserID, @OrderDate, @OrderStatus, @PaymentMode, @ShippingMode, @Carrier, @TrackingNumber, @TotalOrder, @ExpressFee, @ExpressStatus)" SelectCommand="SELECT * FROM(SELECT *FROM [ORDER_INFO] WHERE ([ExpressStatus] = @ExpressStatus))AS PRO,[EXPRESS_STATUS] WHERE
[PRO].ExpressStatus=[EXPRESS_STATUS].ExpressStatus" UpdateCommand="UPDATE [ORDER_INFO] SET [UserID] = @UserID, [OrderDate] = @OrderDate, [OrderStatus] = @OrderStatus, [PaymentMode] = @PaymentMode, [ShippingMode] = @ShippingMode, [Carrier] = @Carrier, [TrackingNumber] = @TrackingNumber, [TotalOrder] = @TotalOrder, [ExpressFee] = @ExpressFee, [ExpressStatus] = @ExpressStatus WHERE [OrderID] = @OrderID">
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
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="ExpressStatus" PropertyName="SelectedValue" />
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
                        <asp:Parameter Name="OrderID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>


            </div>
        </asp:View>

    </asp:MultiView>
</asp:Content>
