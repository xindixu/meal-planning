import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy-data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryId;
  String categoryTitle;
  List<Meal> categoryMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArg =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryId = routeArg['id'];
      categoryTitle = routeArg['title'];

      categoryMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeItem(String id) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle Recipes'),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            final meal = categoryMeals[index];
            return MealItem(
              id: meal.id,
              title: meal.title,
              imageUrl: meal.imageUrl,
              duration: meal.duration,
              complexity: meal.complexity,
              affordability: meal.affordability,
              removeItem: _removeItem,
            );
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
