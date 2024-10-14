import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'common.dart';

class ListingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.1,
              0.4,
              0.6,
              0.9,
            ],
            colors: [
              gredientColor2,
              gredientColor1,
              gredientColor1,
              gredientColor1,
            ],
          )
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/profile_image.png'),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
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
            ),
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
            ),
            SizedBox(height: 25,),
            Expanded(
              child: ListView(
                //padding: EdgeInsets.all(16),
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
