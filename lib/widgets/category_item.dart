import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meal_screen.dart';
class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(
    this.id,
     this.title,
   this.color
  );
  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName,arguments: {
      'id': id,
      'title': title
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){selectCategory(context);},
      splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.1),
              color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
         // color: color,
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Text(title,style: Theme.of(context).textTheme.headline1,),
      ),
    );
  }
}
