import 'package:el_saha/view/Cart/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartItemWidget extends StatelessWidget {
  final CartModel cartModel;

  const CartItemWidget({Key key, this.cartModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(cartModel.product.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color(0xFFFFE6E6),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Row(
          children: [
            Spacer(),
            IconButton(icon: Icon(Icons.delete_rounded, color: Colors.red,), onPressed: (){

            }),
          ],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 1, color: Colors.grey.shade400),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 90,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Image.asset(cartModel.product.images[0]),
                ),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(child: Container(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: Text(cartModel.product.title, style: TextStyle(fontSize: 18), maxLines: 4, overflow: TextOverflow.ellipsis, textAlign: TextAlign.start,)),
                  Text(cartModel.product.price.toString(), style: TextStyle(color: Colors.deepOrangeAccent),)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
