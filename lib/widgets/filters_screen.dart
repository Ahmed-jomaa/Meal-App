// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:foody/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen(
    this.saveFilters,
    this.currentFilters,
  );

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  void initState() {
    _isGlutenFree = widget.currentFilters['gluten']!;
    _isLactoseFree = widget.currentFilters['lactose']!;
    _isVegan = widget.currentFilters['vegan']!;
    _isVegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  Widget BuildSwitchedLIstTiles(String title, String description,
      bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color.fromARGB(255, 80, 91, 248),
                  Color.fromARGB(255, 228, 77, 218)
                ]),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                final Map<String, bool> selectedFilter = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian,
                };
                widget.saveFilters(selectedFilter);
              },
              icon: const Icon(Icons.save_outlined))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text('Adjust Your Meal Selection.',
                style: TextStyle(fontSize: 30)),
          ),
          Expanded(
            child: ListView(
              children: [
                BuildSwitchedLIstTiles('Gluten Free',
                    'Only Include Gluten Free Meal', _isGlutenFree, (newvalue) {
                  setState(() {
                    _isGlutenFree = newvalue;
                  });
                }),
                BuildSwitchedLIstTiles(
                    'Lactose Free',
                    'Only Include Lactose Free Meal',
                    _isLactoseFree, (newvalue) {
                  setState(() {
                    _isLactoseFree = newvalue;
                  });
                }),
                BuildSwitchedLIstTiles(
                    'Vegetarian', 'Only Include Vegetarian Meal', _isVegetarian,
                    (newvalue) {
                  setState(() {
                    _isVegetarian = newvalue;
                  });
                }),
                BuildSwitchedLIstTiles(
                    'Vegan', 'Only Include Vegan Meal', _isVegan, (newvalue) {
                  setState(() {
                    _isVegan = newvalue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
