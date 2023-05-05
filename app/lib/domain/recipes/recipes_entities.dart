import 'dart:core';

class Recipe {
  String title;
  String category;
  String subtitle;
  List<dynamic> ingredient;
  String description;
  String url;
  String iconName;

  Recipe(this.title, this.category, this.subtitle, this.ingredient,
      this.description, this.url, this.iconName);
}

class Ingredient {
  String food;
  String quantity;

  Ingredient(this.food, this.quantity);
}

class Category {
  final int id;
  final String name;
  final String iconRes;

  Category(this.id, this.name, this.iconRes);
}

class Food {
  int id;
  String name;
  String image;

  Food(this.id, this.name, this.image);
}
