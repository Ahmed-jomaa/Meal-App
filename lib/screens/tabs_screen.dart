// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:foody/models/meal.dart';
import './category_screen.dart';
import '../widgets/main_drawer.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen(this.favoriteMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'pages': CategoryScreen(),
        'title': 'Categories',
      },
      {
        'pages': FavoriteScreen(widget.favoriteMeals),
        'title': 'Your Favorite...',
      },
    ];
    super.initState();
  }

  int selectedPageIndex = 0;
  void selectpage(int value) {
    setState(() {
      selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[selectedPageIndex]['title'] as String),
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
        ),
        body: _pages[selectedPageIndex]['pages'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: selectpage,
          selectedItemColor: Colors.purple,
          currentIndex: selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.category_outlined),
              label: ('Categories'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite_outline),
              label: ('Favorites'),
            )
          ],
        ),
        drawer: MainDrawer());
  }
}
