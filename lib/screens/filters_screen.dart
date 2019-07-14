import 'package:flutter/material.dart';
import 'dart:async';

import '../widgets/main_drawer.dart';

import '../models/filter.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';
  final Filter filters;
  final Function saveFilters;

  FiltersScreen(this.filters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;

  void _conntectToGlobalFilter() {
    _glutenFree = widget.filters.glutenFree;
    _lactoseFree = widget.filters.lactoseFree;
    _vegan = widget.filters.vegan;
    _vegetarian = widget.filters.vegetarian;
  }

  @override
  void initState() {
    _conntectToGlobalFilter();
    super.initState();
  }

  Widget _buildSwitchTile(
    String title,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text('$title'),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters')),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection',
                style: Theme.of(context).textTheme.title),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile('Gluten-Free', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchTile('Lactose-Free', _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchTile('Vegan', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                _buildSwitchTile('Vegetarian', _vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                OutlineButton(
                  child: Text('Clear'),
                  borderSide: BorderSide(color: Theme.of(context).buttonColor),
                  onPressed: () async {
                    Filter filters = Filter(
                        glutenFree: false,
                        lactoseFree: false,
                        vegan: false,
                        vegetarian: false);
                    widget.saveFilters(filters);
                    _conntectToGlobalFilter();
                    await new Future.delayed(
                        const Duration(milliseconds: 1000));
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                RaisedButton(
                  child: Text('Save'),
                  color: Theme.of(context).buttonColor,
                  onPressed: () async {
                    Filter filters = Filter(
                        glutenFree: _glutenFree,
                        lactoseFree: _lactoseFree,
                        vegan: _vegan,
                        vegetarian: _vegetarian);
                    widget.saveFilters(filters);
                    await new Future.delayed(const Duration(milliseconds: 500));
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
