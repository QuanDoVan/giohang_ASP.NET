<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="muahang.aspx.cs" Inherits="DoVanQuan_2019600274.muahang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieude" runat="server">
    Giỏ hàng
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noidung" runat="server">
    <asp:Label ID="label" runat="server" ForeColor="Blue" Font-Bold="true" Font-Size="20" Text="Giỏ hàng" />
    <hr />
    <style>
        table{
            border-collapse: collapse;
        }
       
        td, th {
            padding: 3px 5px;
            border: 1px solid black;
        }
    </style>
     <%
        Response.Write("<input type='hidden' name='action' value='update' />");
        decimal total = 0;
        List<DoVanQuan_2019600274.CartItem> li = (List<DoVanQuan_2019600274.CartItem>)Session["Cart"];
        if(li != null)
        {
            Response.Write("<table>");
            Response.Write("<tr>" +
                "<th>Mã Ts</th>" +
                "<th>Tên Ts</th>" +
                "<th>Ảnh</th>" +
                "<th>Giá tiền</th>" +
                "<th>Số lượng</th>" +
                "<th>Thành tiền</th>" +
                "<th>Xóa</th></tr>\n");
            foreach (var item in li)
            {
                Response.Write("<tr>");
                Response.Write("<td align='center'>" + item.Product.MaTs);
                Response.Write($"<input type='hidden' name='mavd' value='{item.Product.MaTs}' />");
                Response.Write("</td>");
                Response.Write($"<td>{item.Product.TenTs}</td>");
                Response.Write($"<td align='center'><img src='/Anh/{item.Product.TenAnh}' width='100'/></td>");
                Response.Write($"<td align='center'>{item.Product.GiaTien}</td>");
                Response.Write("<td align='center'>");
                Response.Write($"<input type='text' name='qq' size='5' value='{item.Quantity}'/>");
                Response.Write("</td>");
                Response.Write($"<td align='center'>{(item.Quantity * item.Product.GiaTien).ToString("N0")}</td>");
                Response.Write($"<td align='center'><a href='muahang.aspx?action=del&MaTs={item.Product.MaTs}'>Xóa</a></td>");
                total += item.Quantity * item.Product.GiaTien;
            }
            Response.Write("</table>");
            Response.Write($"<p>Tổng tiền các sản phẩm là:<b>{total.ToString("N0")} VNĐ</b></p>");
            Response.Write("<input type='submit' value='Cập nhật' name='sb' class='button'/>");
            Response.Write($"<p><a href='muahang.aspx?action=delall' class='button'>Xóa tất cả</a></p>");
            Response.Write("<p><a href='#' class='button'>Đặt hàng</a></p><br>");
             Response.Write("<p><a href='danhsachsp.aspx' class='button'>Danh sách sản phẩm</a></p>");
        }
        else
        {
            Response.Write("<i>Chưa có sản phẩm nào</i>");
        }
        %>
</asp:Content>
