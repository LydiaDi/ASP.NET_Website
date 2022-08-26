<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="allManager.aspx.cs" Inherits="_180808.allManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="StyleSheets/allManager.css" type="text/css" rel="Stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="top_allManager">
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

            <div id="View2_Menu2_allManager">
            <asp:Menu ID="Menu2" runat="server" Orientation="Horizontal" OnMenuItemClick="Menu2_MenuItemClick">

                <Items>
                    <asp:MenuItem Text="管理员信息" Value="1"></asp:MenuItem>
                    <asp:MenuItem Text="用户信息" Value="2"></asp:MenuItem>
                    <asp:MenuItem Text="商品信息" Value="3"></asp:MenuItem>
                    <asp:MenuItem Text="订单信息" Value="4"></asp:MenuItem>
                    <asp:MenuItem Text="支付信息" Value="5"></asp:MenuItem>
                    <asp:MenuItem Text="配送信息" Value="6"></asp:MenuItem>
                </Items>
                <LevelMenuItemStyles>
                <asp:MenuItemStyle Font-Underline="False" ForeColor="Black" />
                </LevelMenuItemStyles>
                <LevelSelectedStyles>
                    <asp:MenuItemStyle BorderColor="#CC0000" Font-Underline="False" />
                </LevelSelectedStyles>
                <StaticHoverStyle BorderColor="#CC9756" Font-Bold="True" Font-Italic="False" Font-Size="Large" ForeColor="#CC9756" />
                <StaticMenuItemStyle Font-Size="Large" Height="30px" Width="140px" ForeColor="Black" />
                <StaticSelectedStyle Font-Bold="True" Font-Size="Large" ForeColor="#CC9756" />
            </asp:Menu>
            </div>

            <asp:MultiView ID="MultiView2" runat="server" ActiveViewIndex="0">
                <asp:View ID="View3" runat="server">
                <div id="table_other">
                    <asp:GridView ID="GridView3" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="SqlDataSource5">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                        CommandName="Update" onclientclick="return confirm(&quot;您确定更新吗？&quot;)" 
                                        Text="更新"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" Text="取消"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                        CommandName="Edit" Text="编辑"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                        CommandName="Delete" onclientclick="return confirm(&quot;您确定删除吗？&quot;)" 
                                        Text="删除"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="UserID" HeaderText="管理员编号" InsertVisible="False" 
                                ReadOnly="True" SortExpression="UserID" />
                            <asp:BoundField DataField="UserName" HeaderText="管理员编号名" 
                                SortExpression="UserName" />
                            <asp:BoundField DataField="Password" HeaderText="密码" 
                                SortExpression="Password" />
                            <asp:BoundField DataField="Telephone" HeaderText="电话号码" 
                                SortExpression="Telephone" />
                            <asp:BoundField DataField="ManagerRole" HeaderText="管理员类型" 
                                SortExpression="ManagerRole" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" 
                        DeleteCommand="DELETE FROM [MANAGER_INFO] WHERE [UserID] = @UserID" 
                        InsertCommand="INSERT INTO [MANAGER_INFO] ([UserName], [Password], [Telephone], [ManagerRole]) VALUES (@UserName, @Password, @Telephone, @ManagerRole)" 
                        SelectCommand="SELECT * FROM [MANAGER_INFO]" 
                        UpdateCommand="UPDATE [MANAGER_INFO] SET [UserName] = @UserName, [Password] = @Password, [Telephone] = @Telephone, [ManagerRole] = @ManagerRole WHERE [UserID] = @UserID">
                        <DeleteParameters>
                            <asp:Parameter Name="UserID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="UserName" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                            <asp:Parameter Name="Telephone" Type="String" />
                            <asp:Parameter Name="ManagerRole" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="UserName" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                            <asp:Parameter Name="Telephone" Type="String" />
                            <asp:Parameter Name="ManagerRole" Type="String" />
                            <asp:Parameter Name="UserID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
                </asp:View>
                <asp:View ID="View4" runat="server">
                   <div id="table_other">
                       <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                           DataKeyNames="UserID" DataSourceID="SqlDataSource6" AllowSorting="True">
                           <Columns>
                               <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                               <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" 
                                   ReadOnly="True" SortExpression="UserID" />
                               <asp:BoundField DataField="Level" HeaderText="Level" SortExpression="Level" />
                               <asp:BoundField DataField="UserName" HeaderText="UserName" 
                                   SortExpression="UserName" />
                               <asp:BoundField DataField="Password" HeaderText="Password" 
                                   SortExpression="Password" />
                               <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                               <asp:BoundField DataField="ImageUrl" HeaderText="ImageUrl" 
                                   SortExpression="ImageUrl" />
                               <asp:BoundField DataField="Province" HeaderText="Province" 
                                   SortExpression="Province" />
                               <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                               <asp:BoundField DataField="Address" HeaderText="Address" 
                                   SortExpression="Address" />
                               <asp:BoundField DataField="Postcode" HeaderText="Postcode" 
                                   SortExpression="Postcode" />
                               <asp:BoundField DataField="Telephone" HeaderText="Telephone" 
                                   SortExpression="Telephone" />
                           </Columns>
                       </asp:GridView>
                       <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" 
                           DeleteCommand="DELETE FROM [USER_INFO] WHERE [UserID] = @UserID" 
                           InsertCommand="INSERT INTO [USER_INFO] ([Level], [UserName], [Password], [Email], [ImageUrl], [Province], [City], [Address], [Postcode], [Telephone]) VALUES (@Level, @UserName, @Password, @Email, @ImageUrl, @Province, @City, @Address, @Postcode, @Telephone)" 
                           SelectCommand="SELECT * FROM [USER_INFO]" 
                           UpdateCommand="UPDATE [USER_INFO] SET [Level] = @Level, [UserName] = @UserName, [Password] = @Password, [Email] = @Email, [ImageUrl] = @ImageUrl, [Province] = @Province, [City] = @City, [Address] = @Address, [Postcode] = @Postcode, [Telephone] = @Telephone WHERE [UserID] = @UserID">
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
                               <asp:Parameter Name="Telephone" Type="String" />
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
                               <asp:Parameter Name="Telephone" Type="String" />
                               <asp:Parameter Name="UserID" Type="Int32" />
                           </UpdateParameters>
                       </asp:SqlDataSource>
                   </div>
                </asp:View>
                <asp:View ID="View5" runat="server">
                  <div id="table_other">
                      <asp:GridView ID="GridView5" runat="server" AllowSorting="True" 
                          AutoGenerateColumns="False" DataKeyNames="ProductID" 
                          DataSourceID="SqlDataSource7">
                          <Columns>
                              <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                              <asp:BoundField DataField="ProductClass" HeaderText="ProductClass" 
                                  SortExpression="ProductClass" />
                              <asp:BoundField DataField="ImgUrl1" HeaderText="ImgUrl1" 
                                  SortExpression="ImgUrl1" />
                              <asp:BoundField DataField="Description" HeaderText="Description" 
                                  SortExpression="Description" />
                              <asp:BoundField DataField="OtherDescription" HeaderText="OtherDescription" 
                                  SortExpression="OtherDescription" />
                              <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" 
                                  SortExpression="UnitPrice" />
                              <asp:BoundField DataField="ProductClassID" HeaderText="ProductClassID" 
                                  SortExpression="ProductClassID" />
                              <asp:BoundField DataField="ProductID" HeaderText="ProductID" 
                                  InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                          </Columns>
                      </asp:GridView>
                      <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" 
                          DeleteCommand="DELETE FROM [PRODUCT_INFO] WHERE [ProductID] = @ProductID" 
                          InsertCommand="INSERT INTO [PRODUCT_INFO] ([ProductClass], [ImgUrl1], [ImgUrl2], [ImgUrl3], [ImgUrl4], [ImgUrl5], [Description], [OtherDescription], [UnitPrice], [ProductClassID]) VALUES (@ProductClass, @ImgUrl1, @ImgUrl2, @ImgUrl3, @ImgUrl4, @ImgUrl5, @Description, @OtherDescription, @UnitPrice, @ProductClassID)" 
                          SelectCommand="SELECT * FROM [PRODUCT_INFO]" 
                          UpdateCommand="UPDATE [PRODUCT_INFO] SET [ProductClass] = @ProductClass, [ImgUrl1] = @ImgUrl1, [ImgUrl2] = @ImgUrl2, [ImgUrl3] = @ImgUrl3, [ImgUrl4] = @ImgUrl4, [ImgUrl5] = @ImgUrl5, [Description] = @Description, [OtherDescription] = @OtherDescription, [UnitPrice] = @UnitPrice, [ProductClassID] = @ProductClassID WHERE [ProductID] = @ProductID">
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
                </asp:View>
                <asp:View ID="View6" runat="server">
                <div id="table_other">
                    <asp:GridView ID="GridView6" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" DataKeyNames="OrderID" 
                        DataSourceID="SqlDataSource8">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="OrderID" />
                            <asp:BoundField DataField="UserID" HeaderText="UserID" 
                                SortExpression="UserID" />
                            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" 
                                SortExpression="OrderDate" />
                            <asp:BoundField DataField="OrderStatus" HeaderText="OrderStatus" 
                                SortExpression="OrderStatus" />
                            <asp:BoundField DataField="Location" HeaderText="Location" 
                                SortExpression="Location" />
                            <asp:BoundField DataField="zhifu" HeaderText="zhifu" SortExpression="zhifu" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" 
                        DeleteCommand="DELETE FROM [ORDER_INFO] WHERE [OrderID] = @OrderID" 
                        InsertCommand="INSERT INTO [ORDER_INFO] ([UserID], [OrderDate], [OrderStatus], [PaymentMode], [ShippingMode], [Carrier], [TrackingNumber], [TotalOrder], [ExpressFee], [ExpressStatus], [Location], [zhifu]) VALUES (@UserID, @OrderDate, @OrderStatus, @PaymentMode, @ShippingMode, @Carrier, @TrackingNumber, @TotalOrder, @ExpressFee, @ExpressStatus, @Location, @zhifu)" 
                        SelectCommand="SELECT * FROM [ORDER_INFO]" 
                        UpdateCommand="UPDATE [ORDER_INFO] SET [UserID] = @UserID, [OrderDate] = @OrderDate, [OrderStatus] = @OrderStatus, [PaymentMode] = @PaymentMode, [ShippingMode] = @ShippingMode, [Carrier] = @Carrier, [TrackingNumber] = @TrackingNumber, [TotalOrder] = @TotalOrder, [ExpressFee] = @ExpressFee, [ExpressStatus] = @ExpressStatus, [Location] = @Location, [zhifu] = @zhifu WHERE [OrderID] = @OrderID">
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
                            <asp:Parameter Name="zhifu" Type="String" />
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
                            <asp:Parameter Name="ExpressStatus" Type="String" />
                            <asp:Parameter Name="Location" Type="String" />
                            <asp:Parameter Name="zhifu" Type="String" />
                            <asp:Parameter Name="OrderID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
                </asp:View>

                <asp:View ID="View7" runat="server">
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
                <asp:View ID="View8" runat="server">
                <div id="table_delivery">

                <div id="table_top_delivery">
                <asp:Label ID="Label2" runat="server" Text="选择发货状态：" Font-Size="Large"></asp:Label>
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="ExpressStatusClass" DataValueField="ExpressStatus" Font-Size="Large"></asp:DropDownList>
                </div>

                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" SelectCommand="SELECT * FROM [EXPRESS_STATUS]"></asp:SqlDataSource>

                <div id="table_bottom_delivery">
                <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="SqlDataSource4">
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


                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" DeleteCommand="DELETE FROM [ORDER_INFO] WHERE [OrderID] = @OrderID" InsertCommand="INSERT INTO [ORDER_INFO] ([UserID], [OrderDate], [OrderStatus], [PaymentMode], [ShippingMode], [Carrier], [TrackingNumber], [TotalOrder], [ExpressFee], [ExpressStatus]) VALUES (@UserID, @OrderDate, @OrderStatus, @PaymentMode, @ShippingMode, @Carrier, @TrackingNumber, @TotalOrder, @ExpressFee, @ExpressStatus)" SelectCommand="SELECT * FROM(SELECT *FROM [ORDER_INFO] WHERE ([ExpressStatus] = @ExpressStatus))AS PRO,[EXPRESS_STATUS] WHERE
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
                        <asp:ControlParameter ControlID="DropDownList2" Name="ExpressStatus" 
                            PropertyName="SelectedValue" />
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



        </asp:View>

    </asp:MultiView>
</asp:Content>
