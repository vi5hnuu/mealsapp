import 'package:flutter/material.dart';
import 'package:mealsapp/modals/meal.dart';
import 'package:mealsapp/screens/mwal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;


  void selectMeal(BuildContext ctx) {
    Navigator.pushNamed(ctx, MealDetailScreen.routeName,arguments: {'id':this.id});
  }

  String get complexityText{
    switch(complexity){
      case Complexity.Simple :return "Simple";
      case Complexity.Hard:return "Hard";
      case Complexity.Challenging:return "Challenging";
      default:return "Unknown";
    }
  }
  const MealItem(
      {
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability});
  String get affordabilityText{
    switch(affordability){
      case Affordability.Pricey :return "Pricey";
      case Affordability.Luxurious:return "Luxurious";
      case Affordability.Affordable:return "Affordable";
      default:return "Unknown";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        //Todo : splash hidden behind card ??? How ??
        onTap: (){
          selectMeal(context);
        },
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width-20,
                      color: Colors.black26,
                      child: FittedBox(
                        child: Text(title,style: TextStyle(
                          fontSize: 24,
                          color: Colors.white70,
                        ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.schedule_rounded),
                        SizedBox(width: 6,),
                        Text('${duration} min')
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.energy_savings_leaf_outlined),
                        SizedBox(width: 6,),
                        Text(this.complexityText)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 6,),
                        Text(this.affordabilityText)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
