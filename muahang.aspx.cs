using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoVanQuan_2019600274
{
    public partial class muahang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string action = Request["action"];
            if (action != null)
            {
                if (action.Equals("del"))
                {
                    List<CartItem> li2 = (List<CartItem>)Session["Cart"];
                    CartItem ci2 = new CartItem();
                    ci2.Product.MaTs = Request["MaTs"];
                    li2.Remove(ci2);
                    if (li2.Count == 0)
                    {
                        Session["Cart"] = null;
                    }
                    else
                    {
                        Session["Cart"] = li2;
                    }
                }
                else if (action.Equals("add"))
                {
                    string mavd = Request["MaTs"];
                    string tenvd = Request["TenTs"];
                    string tenanh = Request["TenAnh"];
                    Decimal price = Decimal.Parse(Request["Giatien"]);
                    CartItem ci = new CartItem();
                    ci.Product.MaTs = mavd;
                    ci.Product.TenTs = tenvd;
                    ci.Product.TenAnh = tenanh;
                    ci.Product.GiaTien = price;
                    ci.Quantity = 1;
                    List<CartItem> li = (List<CartItem>)Session["Cart"];
                    if (li == null)
                    {
                        li = new List<CartItem>();

                    }
                    if (li.Contains(ci))
                    {
                        li[li.IndexOf(ci)].Quantity++;
                    }
                    else li.Add(ci);
                    Session["Cart"] = li;
                    Response.Redirect("muahang.aspx");
                }
                else if (action.Equals("delall"))
                {
                    Session["Cart"] = null;
                }
                else if (action.Equals("update"))
                {
                    List<CartItem> li = (List<CartItem>)Session["Cart"];
                    string mavd = Request["mavd"];
                    string quantity = Request["qq"];
                    string[] amavd = mavd.Split(',');
                    string[] aquantity = quantity.Split(',');
                    int i = 0;
                    foreach (var item in li)
                    {
                        CartItem it = new CartItem();
                        it.Product.MaTs = amavd[i];
                        it.Quantity = int.Parse(aquantity[i]);
                        int ix = li.IndexOf(it);
                        li[ix].Quantity = it.Quantity;
                        i++;
                    }
                    Session["Cart"] = li;
                }
            }
        }
    }
}