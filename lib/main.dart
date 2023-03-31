import 'package:flutter/material.dart';
import 'package:restoapp/models/restaurants.dart';
import 'package:restoapp/restaurant_detail.dart';
import 'package:restoapp/restaurant_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: RestaurantListScreen.routeName,
      routes: {
        RestaurantListScreen.routeName : (context) => const RestaurantListScreen(),
        DetailRestaurantScreen.routeName: (context) => DetailRestaurantScreen(
              restaurant: ModalRoute.of(context)?.settings.arguments as Restaurants),
      },
    );
  }
}

