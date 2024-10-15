import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class SearcheBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Saint Petersburg',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Icon(Icons.tune, color: Colors.grey),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Center(
            child: Icon(Feather.sliders, size: 16, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
