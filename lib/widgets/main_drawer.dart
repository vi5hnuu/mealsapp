import 'package:flutter/material.dart';
import 'package:mealsapp/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget drawerTile(
      {required Icon icon, required title, required void Function() callBack}) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondesed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: callBack,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
              .copyWith(topRight: Radius.circular(120),bottomLeft: Radius.zero),
        ),
        elevation: 4,
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(120)),
                color: Theme.of(context).primaryColor,
              ),
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Cooking up!',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            drawerTile(
                icon: Icon(
                  Icons.restaurant,
                  size: 26,
                ),
                title: 'Meals',
                callBack: () {
                  Navigator.of(context).pushReplacementNamed('/');
                }),
            drawerTile(
                icon: Icon(
                  Icons.settings,
                  size: 26,
                ),
                title: 'Filters',
                callBack: () {
                  Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
                })
          ],
        ),
      ),
    );
  }
}
