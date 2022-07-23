import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/category_item.dart';
import 'package:mealsapp/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES
            .map(
              (category) => CategoryItem(id: category.id,title: category.title,color: category.color,),
            )
            .toList(),
      );
  }
}
