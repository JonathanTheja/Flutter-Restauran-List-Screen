

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:restoapp/models/restaurants.dart';

class DetailRestaurantScreen extends StatelessWidget {
  static const routeName = '/detail';
  final Restaurants restaurant;
  const DetailRestaurantScreen({Key? key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(restaurant.name),
        ),
        // body: ,
    );
  } 
}