import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';
import 'package:mealsapp/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = "/categoryScreen";
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs["title"] as String;
    final categoryId = routeArgs["id"] as String;
    final categorymeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList(growable: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final currentMeal = categorymeals[index];
          return MealItem(
              id: currentMeal.id,
              title: currentMeal.title,
              imageUrl: currentMeal.imageUrl,
              duration: currentMeal.duration,
              complexity: currentMeal.complexity,
              affordability: currentMeal.affordability);
        },
        itemCount: categorymeals.length,
      ),
    );
  }
}
