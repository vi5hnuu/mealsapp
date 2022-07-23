import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/main_drawer.dart';
import 'package:mealsapp/widgets/meal_item.dart';

import '../modals/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = "/categoryScreen";
  List<Meal> availableMeals;
  CategoryMealScreen({required this.availableMeals});
  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late String categoryTitle;
  late String categoryId;
  late List<Meal> categoryMeals;
  bool _loadedInitData=false;

  @override
  void initState() {

    super.initState();
  }

  @override
  void didChangeDependencies() {
    //ToDo :routeArgs cannot be accessible in initState[Reason ?]
    //this method is also called before build only one time
    if(!_loadedInitData) {
      final routeArgs =
      ModalRoute
          .of(context)
          ?.settings
          .arguments as Map<String, String>;
      categoryTitle = routeArgs["title"] as String;
      categoryId = routeArgs["id"] as String;
      categoryMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _loadedInitData=true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final currentMeal = categoryMeals[index];
          return MealItem(
              id: currentMeal.id,
              title: currentMeal.title,
              imageUrl: currentMeal.imageUrl,
              duration: currentMeal.duration,
              complexity: currentMeal.complexity,
              affordability: currentMeal.affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
