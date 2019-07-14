import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../dummy-data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal-details';

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final id = routeArg['id'];

    final Meal meal = DUMMY_MEALS.where((meal) => meal.id == id).toList()[0];

    return Scaffold(
      appBar: AppBar(
        title: Text('${meal.title}'),
      ),
      body: Center(
        child: Text('hah'),
      ),
    );
  }
}
