import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
 static const routeName = 'category_meal';
 final List<Meal> availableMeal;
   CategoryMealScreen(this.availableMeal);
  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String catTitle ;
  List<Meal> categoryMeal ;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routesArg = ModalRoute.of(context).settings.arguments as Map<String,String> ;
    final catId = routesArg['id'];
    catTitle = routesArg['title'];
    categoryMeal = widget.availableMeal.where((meal) {
      return meal.categories.contains(catId);
    }).toList();
    super.didChangeDependencies();
  }
  @override

  void _removedMeal(String mealId){
      setState(() {
        categoryMeal.removeWhere((meal) => meal.id == mealId);
      });
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(title: Text(catTitle),),
      body: ListView.builder(itemBuilder: (ctx,index){
        return MealItem(imageUrl: categoryMeal[index].imageUrl,
        title:categoryMeal[index].title , duration:categoryMeal[index].duration,
          complexity:categoryMeal[index].complexity , affordability: categoryMeal[index].affordability,id: categoryMeal[index].id ,
        );
      },
      itemCount: categoryMeal.length,
      ),
    );
  }
}
