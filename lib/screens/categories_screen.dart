import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/category_item.dart';
class Categories_Screen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return GridView(
       padding: const EdgeInsets.all(25.0), gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent
      (maxCrossAxisExtent: 200,
       childAspectRatio: 3/2,
      crossAxisSpacing: 40,
      mainAxisExtent: 200,

    ),
      children: DUMMY_CATEGORIES.map((catData) => CategoryItem(catData.id,catData.title,catData.color)
      ).toList(),);
  }
}
