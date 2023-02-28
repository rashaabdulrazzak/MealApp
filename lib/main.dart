import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/screens/category_meal_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'models/meal.dart';
import 'screens/categories_screen.dart';
import 'screens/filter_screen.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Map<String,bool> _filters = {
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String,bool> filteredData){
    setState(() {
      _filters = filteredData;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if(_filters['gluten']! && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose']! && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan']! && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian']! && !meal.isVegetarian){
          return false;
        }
       return true;
      }).toList();
    });
  }
  void _toggleFavorites(String mealId){
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex >= 0 ){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }else {
      _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
  }
  bool _isMealFavorite(String mealId){
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(

        primarySwatch: Colors.pink,
        secondaryHeaderColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255,254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(

          bodyText1: const TextStyle(
            color: Color.fromRGBO(20,50,50,1),
          ),
          bodyText2: const TextStyle(
            color: Color.fromRGBO(20,50,50,1),
          ),
          headline1: const TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
      // home:  MyHomePage(),
      routes: {
      //  '/' : (context)=> MyHomePage(),
        '/' : (context)=> TabsScreen(_favoriteMeals),
        CategoryMealScreen.routeName : (context) => CategoryMealScreen(_availableMeal),
        MealDetailScreen.routeName:(context)=> MealDetailScreen(_toggleFavorites,_isMealFavorite),
        FiltersScreen.routeName : (context)=> FiltersScreen( userFilters: _filters,saveFilter :_setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text('Meal app'),
      ),
      body: Categories_Screen()
         );
  }
}
