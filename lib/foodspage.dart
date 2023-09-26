import 'package:flutter/material.dart';
import 'package:food_app/detail_food_page.dart';
import 'package:food_app/fake_data.dart';
import 'package:food_app/models/category.dart';
import 'package:food_app/models/food.dart';

import 'models/food.dart';


class FoodsPage extends StatelessWidget{
  static String routerName='/FoodsPage';
  Category? categoryss;

  FoodsPage({ this.categoryss});
  @override
  Widget build(BuildContext context) {
    Map<String, Category>? arguments = ModalRoute.of(context)!.settings.arguments as Map<String, Category>?;
    categoryss = arguments?['category'];
    List<dynamic> foods=FAKE_FOODS.where((element) => element.categoryId==categoryss?.id).toList();
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
         centerTitle: true,
         title: Text("Food /'s ${categoryss?.content}",style: TextStyle(color: Colors.white),), backgroundColor:Colors.green
     ),
     body: Center(
         child: foods.length>0 ? ListView.builder(
             padding: const EdgeInsets.all(8),
             itemCount: foods.length,
             itemBuilder: ( context, int index) {
               Food food= foods[index];
               return InkWell(
                 onTap: (){
                   Navigator.of(context).push(
                       MaterialPageRoute(builder: (
                               (context)=>DetailFoodPage(food:food)
                       )
                       )
                   );
                 },
                 child: Stack(
                     children: <Widget>[
                       Container(
                         padding: EdgeInsets.all(20),
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(10),
                           clipBehavior: Clip.hardEdge,
                           child: Center(
                             child: FadeInImage.assetNetwork(placeholder: 'assets/images/loading.gif', image: food.urlImage),
                           ),
                         ),
                       ),
                       Positioned(

                         top: 30,
                         left: 30,
                         child: Container(
                             padding: EdgeInsets.all(3),
                             decoration: BoxDecoration(
                                 color: Colors.black45,
                                 borderRadius: BorderRadius.circular(8),
                                 border: Border.all(color: Colors.white,width: 1)
                             ),
                             child:Row(
                               children: [
                                 Icon(Icons.timer,color: Colors.white,size: 22,),
                                 SizedBox(width: 2,),
                                 Text('${food.duration.inMinutes} minutes',style: TextStyle(color: Colors.white,fontSize: 20),)
                               ],
                             )
                         ),
                       ),
                       Positioned(
                         top: 30,
                         right: 30,
                         child: Container(
                             padding: EdgeInsets.all(3),
                             decoration: BoxDecoration(
                                 color: Colors.green,
                                 borderRadius: BorderRadius.circular(8),
                                 border: Border.all(color: Colors.white,width: 1)
                             ),
                             child:Row(
                               children: [
                                 Text('${food.complexity.toString().split(".").last} ',style: TextStyle(color: Colors.black,fontSize: 20),)
                               ],
                             )
                         ),
                       ),
                       Positioned(
                         bottom: 30,
                         right: 30,
                         child: Container(
                             padding: EdgeInsets.all(3),
                             decoration: BoxDecoration(
                                 color: Colors.black45,
                                 borderRadius: BorderRadius.circular(8),
                                 border: Border.all(color: Colors.white,width: 1)
                             ),
                             child:Row(
                               children: [
                                 Text('${food.name} minutes',style: TextStyle(color: Colors.white,fontSize: 20),)
                               ],
                             )
                         ),
                       )
                     ]
                 ),
               );
             }
         ):
         Text("No food found")
     ),
   );
  }

}