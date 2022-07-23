import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/MealDetailScreen';
  final void Function(String) favCallback;
  final bool Function(String) isfavCallback;
  const MealDetailScreen({required this.favCallback,required this.isfavCallback});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String categoryMealId = routeArgs['id']!;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((mealItem) => mealItem.id == categoryMealId);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: (){
            favCallback(selectedMeal.id);
          },
          child: Icon(isfavCallback(selectedMeal.id) ? Icons.star_outlined:Icons.star_border,color: Colors.red,),tooltip: 'Delete recipe Temporarely',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                clipBehavior: Clip.hardEdge,
                height: 250,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'Ingredient',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              MealDetailSection(items: selectedMeal.ingredients),
              Divider(height: 20,color: Colors.grey,thickness: 1,indent: 20,endIndent: 20,),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'Steps',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              MealDetailSection(items: selectedMeal.steps,)
            ],
          ),
        ));
  }
}

class MealDetailSection extends StatelessWidget {
  const MealDetailSection({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(color: Colors.black26, width: 2)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15).copyWith(top: 20),
      child: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.black26, width: 2),
            ),
            color: Colors.white38,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("${index+1}. ${items[index]}")),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
