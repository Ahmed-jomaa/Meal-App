import 'package:flutter/material.dart';
import './models/meal.dart';
import './widgets/2.2%20dummy_data.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './widgets/filters_screen.dart';
import './screens/category_meal_screens.dart';
import '../screens/category_screen.dart';
import './widgets/filters_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeal = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void _toggelFavorite(String mealID) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealID);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
      });
    }
  }

  bool isMealFavorite(String id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      availableMeal ==
          DUMMY_MEALS.where((element) {
            if (_filters['gluten']! && element.isGlutenFree) {
              return false;
            }
            if (_filters['lactose']! && !element.isLactoseFree) {
              return false;
            }
            if (_filters['vegan']! && !element.isVegan) {
              return false;
            }
            if (_filters['vegetarian']! && !element.isVegetarian) {
              return false;
            }
            return true;
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        '/': (context) => TabsScreen(favoriteMeals),
        categoryMealsScreen.routeName: (context) =>
            categoryMealsScreen(availableMeal),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggelFavorite, isMealFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_setFilters, _filters),
      },
    );
  }
}

class myhomepage extends StatefulWidget {
  const myhomepage({super.key});

  @override
  State<myhomepage> createState() => _myhomepageState();
}

class _myhomepageState extends State<myhomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
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
      body: null,
    );
  }
}
