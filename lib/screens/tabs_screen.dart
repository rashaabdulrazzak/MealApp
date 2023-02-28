import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

import '../models/meal.dart';
class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;

   TabsScreen( this.favoriteMeals);


  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   late List<Map<String,Object> > _pages ;
  int _selectedPageIndex = 0 ;
  void _selectedPage(int value) {
   setState(() {
     _selectedPageIndex = value;
   });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages =   [
      {
        'page': Categories_Screen(),
        'title': 'Categories',
      },
      {
        'page': FavoriteScreen(widget.favoriteMeals),
        'title': 'Your Favorites',
      },
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'].toString()),),
      body:  _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).secondaryHeaderColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        onTap: _selectedPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Category'
          ),
          BottomNavigationBarItem(
            icon:  Icon(Icons.star),
              label: 'Favorites',
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }


}
