import 'package:flutter/foundation.dart';

class Filter {
  final bool glutenFree;
  final bool lactoseFree;
  final bool vegan;
  final bool vegetarian;

  const Filter({
    @required this.glutenFree,
    @required this.lactoseFree,
    @required this.vegan,
    @required this.vegetarian,
  });
}
