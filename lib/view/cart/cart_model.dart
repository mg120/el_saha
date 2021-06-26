import 'package:el_saha/models/Product.dart';

class CartModel{
  final Product product;
  final int numOfItem;

  CartModel({this.product, this.numOfItem});
}

// Demo data for our cart
List<CartModel> demoCarts = [
  CartModel(product: demoProducts[0], numOfItem: 2),
  CartModel(product: demoProducts[1], numOfItem: 1),
  CartModel(product: demoProducts[3], numOfItem: 1),
];