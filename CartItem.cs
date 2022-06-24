using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoVanQuan_2019600274
{
    public class CartItem
    {
        public Product Product { get; set; }
        public int Quantity { get; set; }

        public CartItem()
        {
            Product = new Product();
        }
        public override bool Equals(object obj)
        {
            CartItem cartItem = (CartItem)obj;
            return Product.MaTs.Equals(cartItem.Product.MaTs);
        }
    }
}