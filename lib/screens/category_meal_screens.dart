// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class categoryMealsScreen extends StatefulWidget {
  static const routeName = 'CategoryMeals';

  final List<Meal> availableMeal;
  const categoryMealsScreen(this.availableMeal, {super.key});

  @override
  State<categoryMealsScreen> createState() => _categoryMealsScreenState();
}

class _categoryMealsScreenState extends State<categoryMealsScreen> {
  late String categorytitle;
  late List<Meal> displaeydMeals;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryid = routeArgs['id'];
    categorytitle = routeArgs['title']!;
    displaeydMeals = widget.availableMeal.where((meal) {
      return meal.categories.contains(categoryid);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  void _removeMeal(String MealID) {
    setState(() {
      displaeydMeals.removeWhere((meal) => meal.id == MealID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color.fromARGB(255, 80, 91, 248),
                  Color.fromARGB(255, 228, 77, 218)
                ],),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displaeydMeals[index].id,
            imageUrl: displaeydMeals[index].imageUrl,
            title: displaeydMeals[index].title,
            duration: displaeydMeals[index].duration,
            complexity: displaeydMeals[index].complexity,
            affordability: displaeydMeals[index].affordability,
          );
        },
        itemCount: displaeydMeals.length,
      ),
    );
  }
}
