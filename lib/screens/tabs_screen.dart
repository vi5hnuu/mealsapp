import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mealsapp/screens/category_screen.dart';
import 'package:mealsapp/screens/favourites_screen.dart';

import '../modals/meal.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favMeals;
  TabsScreen({required this.favMeals});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   late final List<Map<String, Object>> _pages ;
  int selectedpageIndex = 0;

  @override
  void initState() {
    _pages= [
    {'page': CategoryScreen(), "title": "Category"},
    {'page': FavouriteScreen(fMeals:widget.favMeals), "title": "Favourites"}
    ];
    super.initState();
  }
  void _selectPage(int index) {
    setState(() {
      selectedpageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        centerTitle: true,
        title: Text(_pages[selectedpageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[selectedpageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        currentIndex: selectedpageIndex,
        type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category_outlined,
              ),
              label: 'Category',
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: 'Favourites',
              backgroundColor: Theme.of(context).primaryColor),
        ],
      ),
    );
  }
}

/*
bottom: TabBar(
          tabs: [
          Tab(
            icon: Icon(Icons.category),text: 'Category',
          ),
          Tab(
            icon: Icon(Icons.star_border),text: 'Favourits',
          ),
        ],),
* */
