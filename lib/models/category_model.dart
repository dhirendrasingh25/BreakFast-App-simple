import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel(
      {required this.name, required this.iconPath, required this.boxColor});

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        name: 'Salad',
        iconPath: 'assets/icons/plate2.svg',
        boxColor: Color(0xff92A3FD)));
    categories.add(CategoryModel(
        name: 'Cake',
        iconPath: 'assets/icons/pancakes.svg',
        boxColor: Color(0xffC58BF2)));
    categories.add(CategoryModel(
        name: 'Pie',
        iconPath: 'assets/icons/Vector.svg',
        boxColor: Color(0xff92A3FD)));
    categories.add(CategoryModel(
        name: 'Smoothie',
        iconPath: 'assets/icons/orange-snacks.svg',
        boxColor: Color(0xffC58BF2)));
    return categories;
  }
}
