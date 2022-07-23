import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filterScreen';
  void Function(Map<String, bool>) filterCallback;
  Map<String,bool> filters;
  FilterScreen({required this.filters,required this.filterCallback});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late bool _glutenFree;
  late bool _vegetarian;
  late bool _vegan;
  late bool _lactoseFree;
  @override
  void initState() {
    _glutenFree=widget.filters['gluten']!;
    _vegetarian=widget.filters['vegetarian']!;
    _vegan=widget.filters['vegan']!;
    _lactoseFree=widget.filters['lactose']!;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
              onPressed: () {
                widget.filterCallback({
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                });
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  value: _glutenFree,
                  onChanged: (bool value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  },
                  title: Text('Gluten Free'),
                  subtitle: Text('i.e selected if you want meals Gluten free'),
                  contentPadding: EdgeInsets.all(15),
                ),
                SwitchListTile(
                  value: _lactoseFree,
                  onChanged: (bool value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  },
                  title: Text('Lactose Free'),
                  subtitle: Text('i.e selected if you want meals Lactose free'),
                  contentPadding: EdgeInsets.all(15),
                ),
                SwitchListTile(
                  value: _vegan,
                  onChanged: (bool value) {
                    setState(() {
                      _vegan = value;
                    });
                  },
                  title: Text('Vegan'),
                  subtitle: Text('i.e selected if you are Vegan'),
                  contentPadding: EdgeInsets.all(15),
                ),
                SwitchListTile(
                  value: _vegetarian,
                  onChanged: (bool value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  },
                  title: Text('Vegetarian'),
                  subtitle: Text('i.e selected if you are Vegetarian'),
                  contentPadding: EdgeInsets.all(15),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
