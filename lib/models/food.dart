import 'dart:math';

import 'package:flutter/cupertino.dart';
class Food {
  int ?id;
  String name;
  String urlImage;
  Duration duration; //time to finish this food
  Complexity? complexity;
  //one foods has many ingredients
 List<String>?ingredients=[];
  //reference: 1 Category has many Foods
  int? categoryId;
  Food({
    required this.name,
    required this.urlImage,
    required this.duration,
     this.complexity,
     this.ingredients,
     this.categoryId
  }){
    this.id=Random().nextInt(1000);
  }
//constructor:

}

enum Complexity {
  Simple,
  Medium,
  Hard
}