import 'package:flutter/material.dart';

class SubMenuItem {
  final String label;
  final String image;
  SubMenuItem({
    required this.label,
    required this.image,
  });
}

class MenuItems {
  final String label;
  final IconData icon;
  final String? description;
  final Color? color;
  MenuItems({
    required this.label,
    required this.icon,
    this.description,
    this.color,
  });
}
