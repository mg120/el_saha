import 'package:el_saha/models/Product.dart';
import 'package:el_saha/view/Details/components/product_images.dart';
import 'package:flutter/material.dart';

import 'components/product_details._info.dart';

class DetailsBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductsImages(),
        SizedBox(height: 16.0,),
        ProductDetailsInfo(),
      ],
    );
  }
}
