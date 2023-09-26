import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/food.dart';

class DetailFoodPage extends StatelessWidget{
  Food food;

  DetailFoodPage({required this.food});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:Text( "This is detail ${food.name}"),
      ),
      body: Center(
        child: food != null && food.ingredients != null ?Column(
          children: [
            FadeInImage.assetNetwork(placeholder: 'assets/images/loading.gif', image: food!.urlImage),
            Text("Ingerler"),
            Expanded(child: ListView.builder(
              itemCount: food?.ingredients?.length,
              itemBuilder: ( context, int index) {
                String? ingredient = this.food.ingredients?[index];
                if (ingredient != null) {
                  return ListTile(
                    leading: Text("${index}"),
                    title: Text('${ingredient}'),
                  );
                } else {
                  print('ádas');
                }
              },
            )
            )
          ],
        ):Text("Not ingredients")
      )
    );
  }
}