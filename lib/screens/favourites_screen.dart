import 'package:flutter/material.dart';
import 'package:mealsapp/modals/meal.dart';

import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> fMeals;
  const FavouriteScreen({required this.fMeals});

  @override
  Widget build(BuildContext context) {
    return Center(
        child:fMeals.isEmpty ? Text('You Have No Favourites Text'):
        ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final currentMeal = fMeals[index];
            return MealItem(
              id: currentMeal.id,
              title: currentMeal.title,
              imageUrl: currentMeal.imageUrl,
              duration: currentMeal.duration,
              complexity: currentMeal.complexity,
              affordability: currentMeal.affordability,
            );
          },
          itemCount: fMeals.length,
        ),
    );
  }
}
