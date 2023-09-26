import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/category.dart';

import 'foodspage.dart';

class CategoryItem extends StatelessWidget{
  Category categoryss;

  CategoryItem({required this.categoryss});


  @override
  Widget build(BuildContext context) {
    Color _color = categoryss.color;

    // TODO: implement build
   return InkWell(
     onTap:(){
       print("You does tap ${categoryss.content}");
       // Navigator.of(context).push(
       //   MaterialPageRoute(builder: (
       //           (context)=>FoodsPage(category: categoryss,)
       //   )
       //   )
       // );
       Navigator.pushNamed(context, FoodsPage.routerName,arguments: {'category':categoryss});
   },
     splashColor: Colors.deepOrangeAccent,
     child: Container(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Text(categoryss.content,style: TextStyle(
               fontWeight: FontWeight.bold,
               color: Colors.white
           ),
           ),
         ],
       ),
       decoration: BoxDecoration(
           gradient: LinearGradient(
               colors: [
                 _color.withOpacity(0.8),
                 _color,
               ],
               begin: Alignment.topRight,
               end: Alignment.bottomLeft
           ),
           color: _color,
           borderRadius: BorderRadius.circular(20)
       ),
     ),
   );
  }

}