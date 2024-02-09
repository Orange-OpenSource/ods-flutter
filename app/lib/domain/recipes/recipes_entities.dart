/*
 * Software Name : Orange Design System
 * SPDX-FileCopyrightText: Copyright (c) Orange SA
 * SPDX-License-Identifier: MIT
 *
 * This software is distributed under the MIT licence,
 * the text of which is available at https://opensource.org/license/MIT/
 * or see the "LICENSE" file for more details.
 *
 * Software description: Flutter library of reusable graphical components for Android and iOS
 */

import 'dart:convert';

Entity entityFromJson(String str) => Entity.fromJson(json.decode(str));

class Entity {
  List<Recipe> recipes;
  List<Category> category;
  List<Food> foods;

  Entity({
    required this.recipes,
    required this.category,
    required this.foods,
  });

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
        recipes:
            List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x))),
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recipes": List<dynamic>.from(recipes.map((x) => x.toJson())),
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
      };

  static final Map<String, String> iconPaths = {
    "Restaurant": 'assets/recipes/ic_restaurant.svg',
    "CookingPot": 'assets/recipes/ic_cooking_pot.svg',
    "IceCream": 'assets/recipes/ic_ice_cream.svg',
    "Cafe": 'assets/recipes/ic_cooking_pot.svg',
    "InformationData": 'assets/recipes/ic_restaurant.svg',
    "OrangeDetente": 'assets/recipes/ic_cooking_pot.svg',
    "OrangeExpert": 'assets/recipes/ic_ice_cream.svg',
  };
}

class Category {
  int id;
  String name;
  String iconName;

  Category({
    required this.id,
    required this.name,
    required this.iconName,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        iconName: json["iconName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "iconName": iconName,
      };
}

class Food {
  int id;
  String name;
  String image;

  Food({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}

class Recipe {
  String title;
  String catId;
  String subtitle;
  List<Ingredient> ingredients;
  String description;
  String url;
  String iconName;

  Recipe({
    required this.title,
    required this.catId,
    required this.subtitle,
    required this.ingredients,
    required this.description,
    required this.url,
    required this.iconName,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        title: json["title"],
        catId: json["catId"],
        subtitle: json["subtitle"],
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
        description: json["description"],
        url: json["url"],
        iconName: json["iconName"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "catId": catId,
        "subtitle": subtitle,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "description": description,
        "url": url,
        "iconName": iconName,
      };

  String getIconPath() {
    if (Entity.iconPaths.containsKey(iconName)) {
      return Entity.iconPaths[iconName]!;
    } else {
      return 'assets/placeholder.png';
    }
  }
}

class Ingredient {
  int foodId;
  String quantity;

  Ingredient({
    required this.foodId,
    required this.quantity,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        foodId: json["foodId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "foodId": foodId,
        "quantity": quantity,
      };
}
