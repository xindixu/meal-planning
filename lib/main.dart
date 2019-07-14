import 'package:flutter/material.dart';
import './dummy-data.dart';
import './models/meal.dart';
import './models/filter.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _allMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  Filter _filters = Filter(
      glutenFree: false, lactoseFree: false, vegan: false, vegetarian: false);

  void _setFilters(Filter data) {
    setState(() {
      _filters = data;
      _allMeals = DUMMY_MEALS.where((meal) {
        if (_filters.glutenFree && !meal.isGlutenFree) {
          return false;
        }
        if (_filters.lactoseFree && !meal.isLactoseFree) {
          return false;
        }
        if (_filters.vegan && !meal.isVegan) {
          return false;
        }
        if (_filters.vegetarian && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.amberAccent,
          fontFamily: 'Raleway',
          buttonColor: Colors.amberAccent,
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                ),
              )),
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_allMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
      },
      // dynamic route setting
      // onGenerateRoute: (settings){
      //   return MaterialPageRoute(builder: (context) => CategoriesScreen());
      // },
      // 404 fallback
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
