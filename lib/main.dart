//final project

import 'package:flutter/material.dart';
import 'package:techerita/techcrunch.dart';
import 'package:techerita/front.dart';
import 'package:techerita/mitnews.dart';
void main() async {


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/front',
      routes: {
        '/front':(context)=>const FrontScreen(),
        '/techcrunch': (context) => const TechCrunch(),
        '/mitnews':(context)=>const MitNews(),


      },
    );
  }
}
