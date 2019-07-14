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

    final Meal meal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text('${meal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Theme.of(context).accentColor),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: Theme.of(context).accentColor,
                ),
                itemBuilder: (context, index) => Text(meal.ingredients[index]),
                itemCount: meal.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              height: 800,
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text(meal.steps[index]),
                ),
                itemCount: meal.steps.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
