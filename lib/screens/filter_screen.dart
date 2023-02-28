import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';
   final Function(Map<String, bool>)  saveFilter;
   final Map<String, bool> userFilters ;

  FiltersScreen({required this.userFilters,required this.saveFilter});


  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _GlutenFree = widget.userFilters['gluten']!;
    _LactoseFree = widget.userFilters['lactose']!;
    _Vegan = widget.userFilters['vegan']!;
    _Vegetarian = widget.userFilters['vegetarian']!;

  }
  Widget buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updatedValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(subtitle),
        onChanged: updatedValue());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
        actions: [
          IconButton(onPressed: (){
            final Map<String,bool>selectedFilters = {
              'gluten':_GlutenFree,
              'lactose':_GlutenFree,
              'vegan':_Vegan,
              'vegetarian':_Vegetarian,
            };
            widget.saveFilter(selectedFilters);
            }, icon: const Icon(Icons.save)),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal Selection",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile('GlutenFree',
                    'Contains only gluten-free meals', _GlutenFree, (newValue) {
                  setState(() {
                    _GlutenFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    'LactoseFree',
                    'Contains only lactuse-free meals',
                    _LactoseFree, (newValue) {
                  setState(() {
                    _LactoseFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Vegan', 'Contains only vegan meals', _Vegan, (newValue) {
                  setState(() {
                    _Vegan = newValue;
                  });
                }),
                buildSwitchListTile('_Vegetarian',
                    'Contains only vegetarian meals', _Vegetarian, (newValue) {
                  setState(() {
                    _Vegetarian = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
