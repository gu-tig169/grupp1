import 'package:flutter/material.dart';

class CategoryItem {
  final String categoryName;
  final dynamic icon;
  final String urlNumber;

  CategoryItem(this.categoryName, this.icon, this.urlNumber);
}

List<CategoryItem> getCategories() {
  List<CategoryItem> categories = <CategoryItem>[
    CategoryItem('Random', Icons.help_rounded, '9'),
    CategoryItem('Books', Icons.menu_book, '10'),
    CategoryItem('Film', Icons.videocam, '11'),
    CategoryItem('Board Games', Icons.local_play, '16'),
    CategoryItem('Science & Nature', Icons.opacity, '17'),
    CategoryItem('Computers', Icons.laptop_mac, '18'),
    CategoryItem('Sports', Icons.sports_tennis, '21'),
    CategoryItem('Geography', Icons.public, '22'),
    CategoryItem('Animals', Icons.pets, '27'),
    CategoryItem('Vehicles', Icons.drive_eta, '28'),
  ];
  return categories;
}
