import 'package:flutter/material.dart';
import 'package:meal_app/screens/filter_screen.dart';
class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title, IconData iconTitle, VoidCallback tapHandler){
    return ListTile(
      leading: Icon(iconTitle, size: 26,),
      title: Text(title,style:const TextStyle(
        fontSize: 24,
        fontFamily: 'RobotoCondensed',
        fontWeight: FontWeight.bold,
      )),
      onTap:tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).secondaryHeaderColor,
            child: Text('Cooking App',style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor,

            ),),
          ),
          const SizedBox(width: 20,),
          buildListTile('Meal',Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
          buildListTile('Filters',Icons.settings,(){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}),
        ],
      ),
    );
  }
}
