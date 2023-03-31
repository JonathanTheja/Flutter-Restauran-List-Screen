import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restoapp/restaurant_detail.dart';
import 'models/restaurants.dart';

final ScrollController _controller = ScrollController();

class RestaurantListScreen extends StatelessWidget {
  static const routeName = "resto_list";
  const RestaurantListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant App"),
      ),
      body: ScrollbarTheme(
          data: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all<Color>(
                Colors.red), // Set the color of the scrollbar thumb
            trackColor: MaterialStateProperty.all<Color>(Colors.grey),
            // Set the color of the scrollbar track
          ),
          child: Scrollbar(
              controller: _controller,
              isAlwaysShown: true,
              thickness: 8.0,
              radius: Radius.circular(4.0),
              child: FutureBuilder<String>(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/local_restaurant.json'),
                builder: (context, snapshot) {
                  final List<Restaurants> restaurants =
                      parseRestaurants(snapshot.data);
                  return ListView.builder(
                    controller: _controller,
                    itemCount: restaurants.length,
                    itemBuilder: (context, index) {
                      return buildItem(context, restaurants[index]);
                    },
                  );
                },
              ))),
    );
    // body: FutureBuilder<String>(
    //   future: DefaultAssetBundle.of(context)
    //       .loadString('assets/local_restaurant.json'),
    //   builder: (context, snapshot) {
    //     final List<Restaurants> restaurants =
    //         parseRestaurants(snapshot.data);
    //     return ListView.builder(
    //       itemCount: restaurants.length,
    //       itemBuilder: (context, index) {
    //         return buildItem(context, restaurants[index]);
    //       },
    //     );
    //   },
    // ));
  }
}

List<Restaurants> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json)["restaurants"];
  return parsed.map((json) => Restaurants.fromJson(json)).toList();
}

Widget buildItem(BuildContext context, Restaurants restaurant) {
  return ListTile(
      // contentPadding:
      //     const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      contentPadding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 6.0, bottom: 6.0),
      leading: Image.network(restaurant.pictureId, width: 100),
      title: Text(restaurant.name),
      subtitle: Text(restaurant.description),
      onTap: () {
        Navigator.pushNamed(context, DetailRestaurantScreen.routeName,
            arguments: restaurant);
      });
}
