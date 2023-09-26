import 'package:flutter/material.dart';
import 'package:food_app/category_item.dart';

import 'fake_data.dart';
class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView(
      padding: EdgeInsets.all(10),
      children: FAKE_CATEGORIES.map((e) => CategoryItem(categoryss:e)).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
    );
  }
}