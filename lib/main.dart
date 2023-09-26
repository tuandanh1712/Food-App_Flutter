import 'package:flutter/material.dart';
import 'package:food_app/categories_page.dart';
import 'package:food_app/foodspage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App with Navigation',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      initialRoute: "/",
      routes: {
        "/FoodsPage":(context)=>FoodsPage(),
        "/CategoriesPage":(context)=>CategoriesPage()
      },
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Food /'s categories",style: TextStyle(color: Colors.white),), backgroundColor:Colors.green
        ),

        body: CategoriesPage()
      ),
    );
  }
}