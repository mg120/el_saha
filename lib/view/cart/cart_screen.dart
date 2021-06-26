import 'package:el_saha/view/Cart/cart_model.dart';
import 'package:flutter/material.dart';

import 'compenents/CartItemWidget.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData  = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              color: Colors.black,
            ),
            children: [
              TextSpan(text: "Your Cart \n", style: TextStyle(fontSize: 17)),
              TextSpan(text: "cart items ${demoCarts.length.toString()}", style: TextStyle(fontSize: 14)),
            ]
          ),
          textAlign: TextAlign.start,
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10.0),
        scrollDirection: Axis.vertical,
        itemCount: demoCarts.length,
        separatorBuilder: (context, index) => SizedBox(height: 10,),
        itemBuilder: (context, index) => CartItemWidget(cartModel: demoCarts[index]),
      ),
    );
  }
}
