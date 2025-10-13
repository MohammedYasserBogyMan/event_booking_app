import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final IconData icon;
  final Color color;
  final String route;
  const CategoryModel({
    required this.name,
    required this.icon,
    required this.color,
    required this.route,
  });
}
