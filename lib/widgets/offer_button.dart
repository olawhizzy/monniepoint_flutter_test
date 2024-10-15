import 'package:flutter/material.dart';
import 'package:monniepoint_flutter_test/common.dart';

class OfferButton extends StatelessWidget {
  final String label;
  final int count;
  final bool isActive;
  final bool isCircle;

  const OfferButton({
    Key? key,
    required this.label,
    required this.count,
    required this.isActive,
    required this.isCircle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isActive ? yellowheadColor : Colors.white,
        borderRadius: isCircle ? null : BorderRadius.circular(16),
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          TweenAnimationBuilder<int>(
            tween: IntTween(begin: 0, end: count),
            duration: Duration(milliseconds: 2500), // Adjust this for faster/slower animation
            builder: (BuildContext context, int value, Widget? child) {
              return Text(
                value.toString(),
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
          Text(
            'offers',
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
