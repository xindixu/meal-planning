import 'package:flutter/material.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = 'favorites';

  List<Meal> meals = [];

  FavoritesScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('You have no favoriates yet! Start to add some!c'),
    );
  }
}
