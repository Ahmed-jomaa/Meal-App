import 'package:flutter/material.dart';
import 'package:foody/widgets/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget BuildListTile(String title, IconData icon, Function() tabHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: const TextStyle(fontSize: 19)),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            leading: new Container(),
            title: const Text('Cooking Up'),
            centerTitle: true,
         ),
          //Container(
          //  decoration: const BoxDecoration(
          //    gradient: LinearGradient(
          //        begin: Alignment.centerLeft,
          //        end: Alignment.centerRight,
          //        colors: <Color>[
          //          Color.fromARGB(255, 80, 91, 248),
          //          Color.fromARGB(255, 228, 77, 218)
          //        ],),
          //  ),
          //  height: 100,
          //  width: double.infinity,
          //  padding: const EdgeInsets.all(20),
          //  alignment: Alignment.center,
          //  child: Container(
          //    child: const Text(
          //      'Cooking Up',
          //      style: TextStyle(
          //          fontSize: 20,
          //          fontWeight: FontWeight.bold,
          //          color: Colors.white,),
          //    ),
          //  ),
          //),
          BuildListTile('Meal', Icons.restaurant_outlined, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          BuildListTile('Filters', Icons.settings_outlined, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          })
        ],
      ),
    );
  }
}
