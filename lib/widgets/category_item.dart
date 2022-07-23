import 'package:flutter/material.dart';
import 'package:mealsapp/screens/category_meals_screen.dart';

import '../modals/category.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem({required this.id,required this.title, required this.color});

  void selectCategory(BuildContext ctx){
    Navigator.pushNamed(ctx,CategoryMealScreen.routeName,arguments: {'id':this.id,'title':this.title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
        ),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.black12, width: 5),
          gradient: LinearGradient(
              colors: [this.color.withOpacity(0.7), this.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
      ),
    );
  }
}
