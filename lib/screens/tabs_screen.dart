import 'package:flutter/material.dart';
import 'package:mealsapp/screens/category_screen.dart';
import 'package:mealsapp/screens/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MEALS APP'),
        bottom: TabBar(
          tabs: [
          Tab(
            icon: Icon(Icons.category),text: 'Category',
          ),
          Tab(
            icon: Icon(Icons.star_border),text: 'Favourits',
          ),
        ],),
      ),
      body: TabBarView(
        children: [
          CategoryScreen(),//category//no scaffold
          FavouriteScreen()//favourits//no scaffold
        ],
      ),
    ),);
  }
}
