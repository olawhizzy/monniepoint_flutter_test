import 'package:flutter/material.dart';
import 'package:monniepoint_flutter_test/listingView.dart';
import 'package:monniepoint_flutter_test/mapView.dart';

import 'common.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showMap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showMap ? MapView() : ListingView(),
      bottomNavigationBar: CustomBottomNavBar(
        onMapToggle: () {
          setState(() {
            showMap = !showMap;
          });
        },
      ),
    );
  }
}