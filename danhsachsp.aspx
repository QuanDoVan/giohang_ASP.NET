<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="danhsachsp.aspx.cs" Inherits="DoVanQuan_2019600274.danhsachsp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieude" runat="server">
    Danh sách sản phẩm
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="MaTs" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal">
        <ItemTemplate>
            MaTs:
            <asp:Label ID="MaTsLabel" runat="server" Text='<%# Eval("MaTs") %>' />
            <br />
            <b><asp:Label ID="TenTsLabel" runat="server" Text='<%# Eval("TenTs") %>' /></b>
            <br />
            <asp:Image ID="anh" runat="server" ImageUrl='<%# "~/Anh/" + Eval("Anh") %>' width="100"/>
            <br />
            Mota:
            <asp:Label ID="MotaLabel" runat="server" Text='<%# Eval("Mota") %>' />
            <br />
            Soluong:
            <asp:Label ID="SoluongLabel" runat="server" Text='<%# Eval("Soluong") %>' />
            <br />
            Giatien:
            <asp:Label ID="GiatienLabel" runat="server" Text='<%# Eval("Giatien") %>' />
            <br />
            MaDanhmuc:
            <asp:Label ID="MaDanhmucLabel" runat="server" Text='<%# Eval("MaDanhmuc") %>' />
            <br />
            <br />
             
           <asp:Button PostBackUrl='<%# "muahang.aspx?MaTs=" + Eval("MaTs") + "&TenTs=" + Eval("TenTs") + "&TenAnh=" + Eval("Anh") + "&Giatien=" + Eval("Giatien") + "&action=add" %>' runat="server" Text="Mua hàng" class="button"/>
            <br />
               
<br />
        </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QLSanpham2ConnectionString %>" DeleteCommand="DELETE FROM [Trangsuc] WHERE [MaTs] = @MaTs" InsertCommand="INSERT INTO [Trangsuc] ([TenTs], [Anh], [Mota], [Soluong], [Giatien], [MaDanhmuc]) VALUES (@TenTs, @Anh, @Mota, @Soluong, @Giatien, @MaDanhmuc)" SelectCommand="SELECT * FROM [Trangsuc]" UpdateCommand="UPDATE [Trangsuc] SET [TenTs] = @TenTs, [Anh] = @Anh, [Mota] = @Mota, [Soluong] = @Soluong, [Giatien] = @Giatien, [MaDanhmuc] = @MaDanhmuc WHERE [MaTs] = @MaTs">
            <DeleteParameters>
                <asp:Parameter Name="MaTs" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TenTs" Type="String" />
                <asp:Parameter Name="Anh" Type="String" />
                <asp:Parameter Name="Mota" Type="String" />
                <asp:Parameter Name="Soluong" Type="Int32" />
                <asp:Parameter Name="Giatien" Type="Decimal" />
                <asp:Parameter Name="MaDanhmuc" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TenTs" Type="String" />
                <asp:Parameter Name="Anh" Type="String" />
                <asp:Parameter Name="Mota" Type="String" />
                <asp:Parameter Name="Soluong" Type="Int32" />
                <asp:Parameter Name="Giatien" Type="Decimal" />
                <asp:Parameter Name="MaDanhmuc" Type="Int32" />
                <asp:Parameter Name="MaTs" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>
