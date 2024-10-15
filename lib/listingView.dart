import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:monniepoint_flutter_test/widgets/offer_button.dart';

import 'common.dart';
import 'widgets/list_tile.dart';

class ListingView extends StatefulWidget {
  @override
  State<ListingView> createState() => _ListingViewState();
}

class _ListingViewState extends State<ListingView>{


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.4, 0.6, 0.9,],
            colors: [gredientColor2, gredientColor1, gredientColor1, gredientColor1,],
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: grulloColor, size: 12,),
                    Text('Saint Petersburg', style: TextStyle(color: grulloColor, fontSize: 10)),
                  ],
                ),
              ).animate()
                  .slideX(begin: -1, end: 0, duration: 500.ms, curve: Curves.easeOutQuad),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile_image.png'),
              ).animate().scale(duration: 1000.ms, curve: Curves.easeOut),
            ],
          ),

        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, Marina",
                    style: TextStyle(fontSize: 18, color: grulloColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100.0),
                    child: Text(
                      "let's select your perfect place",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ).animate().slideY(begin: 1, end: 0, duration: 500.ms, curve: Curves.easeOutQuad),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(child: OfferButton(label: 'BUY', count: 1034, isActive: true, isCircle: true,)),
                  SizedBox(width: 5),
                  Expanded(child: OfferButton(label: 'RENT', count: 2212, isActive: false, isCircle: false,)),
                ],
              ),
            ).animate()
                .slideY(begin: 1, end: 0, duration: 500.ms, delay: 200.ms, curve: Curves.easeOutQuad),
            SizedBox(height: 15,),
            Expanded(
              child: ListView(
                //padding: EdgeInsets.all(16),
                shrinkWrap: true,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: StaggeredGrid.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      children: [
                        StaggeredGridTile.count(
                          crossAxisCellCount: 4,
                          mainAxisCellCount: 2,
                          child: Tile(index: 0),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 4,
                          child: Tile(index: 1),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 2,
                          child: Tile(index: 2),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 2,
                          child: Tile(index: 3),
                        ),
                      ],
                    ),
                  ).animate()
                      .fadeIn(duration: 600.ms, delay: 300.ms)
                      .slideY(begin: 0.2, end: 0, duration: 600.ms, delay: 300.ms, curve: Curves.easeOutQuad),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
