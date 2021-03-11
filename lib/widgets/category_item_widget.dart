
import 'package:el_saha/models/home_view_model.dart';
import 'package:el_saha/utils/colors.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CategoryItem extends StatelessWidget {
  final Categories categoryModel;

  const CategoryItem({Key key, this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: ()=> print(categoryModel.name),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  child: CircleAvatar(child: Image.network(categoryModel.photo,),radius: 25,)),
              SizedBox(height: 12,),
              CustomText(title: categoryModel.name, color: blackColor,alignment: Alignment.center,)
            ],
          ),
        ),
      ),
    );
  }
}
