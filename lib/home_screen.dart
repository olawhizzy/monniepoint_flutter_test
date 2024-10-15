import 'dart:ui';

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:monniepoint_flutter_test/listingView.dart';
import 'package:monniepoint_flutter_test/mapView.dart';

import 'common.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const _selectedColor = yellowheadColor;
  List<bool> _isRippling = List.generate(5, (_) => false);


  static List<Widget> _pages = <Widget>[
    ListingView(),
    MapView(),
    SearchPage(),
    ProfilePage(),
    ProfilePage(),
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isRippling[index] = true;
      Future.delayed(300.milliseconds, () {
        if (mounted) {
          setState(() {
            _isRippling[index] = false;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: Stack(
        children: [
          _pages.elementAt(_selectedIndex),
          Positioned(
            left: 20,
            right: 20,
            bottom: 40,
            child: Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: darkGreyColor,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Feather.search, 1),
                  _buildNavItem(Feather.message_square, 2),
                  _buildNavItem(Feather.home, 0),
                  _buildNavItem(Feather.heart, 3),
                  _buildNavItem(Icons.person, 4),
                ],
              ),
            ),
          ).animate()
              .fadeIn(duration: 600.ms, delay: 300.ms)
              .slideY(begin: 2, end: 0, duration: 600.ms, delay: 1000.ms, curve: Curves.easeOutQuad),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _selectedIndex == index ? _selectedColor : darkColor,
            ),
            child: Icon(
              icon,
              color: _selectedIndex == index ? Colors.white : Colors.grey[300],
            ),
          ),
          if (_isRippling[index])
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.9),
              ),
            ).animate(onPlay: (controller) => controller.repeat())
                .scale(
                begin: Offset(0.5, 0.5),
                end: Offset(1.5, 1.5),
                duration: 300.ms,
                curve: Curves.easeOut
            )
                .fadeOut(duration: 300.ms, curve: Curves.easeOut),
        ],
      ),
    );
  }
}

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Favorites Page'));
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Search Page'));
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile Page'));
  }
}
