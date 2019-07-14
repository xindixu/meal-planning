import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = 'favorites';

  List<Meal> meals = [];

  FavoritesScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    if (meals.isEmpty) {
      return Center(
        child: Text('You have no favoriates yet! Start to add some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          final meal = meals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
            removeItem: () {},
          );
        },
        itemCount: meals.length,
      );
    }
  }
}
