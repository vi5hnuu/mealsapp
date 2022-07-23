
import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';
import 'package:mealsapp/screens/category_meals_screen.dart';
import 'package:mealsapp/screens/category_screen.dart';
import 'package:mealsapp/screens/filter_screen.dart';
import 'package:mealsapp/screens/mwal_detail_screen.dart';
import 'package:mealsapp/screens/tabs_screen.dart';

import 'modals/meal.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal> _availableMeals=DUMMY_MEALS;
  List<Meal> _favouritesMeal=[];
  void _setFilters(Map<String,bool> filterData){
      setState(() {
        _filters=filterData;
        _availableMeals=DUMMY_MEALS.where((meal){
          //Todo: problem what if all filters are off
          if(meal.isVegetarian && !(_filters['vegetarian']!))
              return false;
          if(meal.isGlutenFree && !(_filters['gluten']!))
            return false;
          if(meal.isLactoseFree && !(_filters['lactose']!))
            return false;
          if(meal.isVegan && !(_filters['vegan']!))
            return false;
          return true;
        }).toList();
      });
  }
  void _toggleFavourite(String mealId){
    int index=_favouritesMeal.indexWhere((meal)=>meal.id==mealId);
    setState(() {
      if(index>=0){
        _favouritesMeal.removeAt(index);
      }else{
        _favouritesMeal.add(DUMMY_MEALS.firstWhere((meal) =>meal.id==mealId ));
      }
    });
  }
  bool _isMealFavourite(String id){
    return _favouritesMeal.any((meal) =>meal.id==id );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apki Apni Meals',
      initialRoute: '/',
      routes: {
        "/":(BuildContext context)=>TabsScreen(favMeals:_favouritesMeal),
        CategoryMealScreen.routeName:(BuildContext context)=>CategoryMealScreen(availableMeals:_availableMeals),
        MealDetailScreen.routeName:(BuildContext context)=>MealDetailScreen(favCallback:_toggleFavourite,isfavCallback:_isMealFavourite),
        FilterScreen.routeName:(BuildContext context)=>FilterScreen(filters:_filters,filterCallback:_setFilters),
      },
      // onGenerateRoute:(RouteSettings settings){} ,when unregistered route is push this will be called
      // onUnknownRoute:(RouteSettings settings){} ,//when registered or ongener dont occur flutter try this to handle situation (fallback->like a 404 page)
      onUnknownRoute: (RouteSettings settins){
        return MaterialPageRoute(builder: (BuildContext ctx){return CategoryScreen();});
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          displayLarge: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
            displayMedium: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1)
            ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'
          )
        )
      ),
    );
  }
}

