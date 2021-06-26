import 'package:el_saha/controllers/product_details_controller.dart';
import 'package:el_saha/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsImages extends StatelessWidget {
  Duration defaultDuration = Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      init: ProductDetailsController(),
      builder:(controller) =>  Column(
          children: [
            SizedBox(
              height: 230, // from screen size in consider later
              child: AspectRatio(
                aspectRatio: 1.2,
                child:Hero(
                  tag: demoProducts[0].id.toString(),
                  child: InteractiveViewer(child: Image.asset(demoProducts[0].images[controller.selectedImage])),
                ),
              ),
            ),
           Container(
             width: double.infinity,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(demoProducts[0].images.length, (index) => GestureDetector(
                      onTap: (){
                        controller.updateSelectedImage(index);
                      },
                      child: AnimatedContainer(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.all(6.0),
                        duration: defaultDuration,
                        width: 60,height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(color: Colors.deepOrangeAccent.withOpacity(controller.selectedImage == index? 1:0)),
                        ),
                        child: Image.asset(demoProducts[0].images[index]),
                      ),
                    ),),
                  ],
              ),
           ),
          ],
      ),
    );
  }
}
