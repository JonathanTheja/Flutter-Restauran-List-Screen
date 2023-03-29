import 'dart:convert';

import 'package:flutter/material.dart';

import 'models/restaurants.dart';

class RestaurantListScreen extends StatelessWidget {
  static const routeName="resto_list";
  const RestaurantListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant App"),
      )
    );
  }
}
List<Restaurants> parseRestaurants(String? json) {
  if (json==null) {
    return [];
  }
  final List parsed=jsonDecode(json)["restaurants"];
  return parsed.map((json)=>Restaurants.fromJson(json)).toList();
}