
import 'package:flutter/material.dart';
import 'package:mealsapp/screens/category_meals_screen.dart';
import 'package:mealsapp/screens/category_screen.dart';
import 'package:mealsapp/screens/mwal_detail_screen.dart';
import 'package:mealsapp/screens/tabs_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apki Apni Meals',
      initialRoute: '/',
      routes: {
        "/":(BuildContext context)=>TabsScreen(),
        CategoryMealScreen.routeName:(BuildContext context)=>CategoryMealScreen(),
        MealDetailScreen.routeName:(BuildContext context)=>MealDetailScreen(),
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

