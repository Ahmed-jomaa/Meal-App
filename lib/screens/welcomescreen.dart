import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Expanded(
      //alignment: Alignment.center,
      //padding: const EdgeInsets.symmetric(horizontal: double.infinity),
      child: Stack(
        
        children: [
          Image.asset('pics/bg.jpg',fit: BoxFit.fitHeight,),
        ],
      ),
    ),  
    );
  }
}