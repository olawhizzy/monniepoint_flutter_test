import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: _buildTileContent(context)),
        if (bottomSpace != null)
          Container(
            height: bottomSpace,
            color: backgroundColor ?? Colors.green,
          ),
      ],
    );
  }

  Widget _buildTileContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/$index.png'),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      height: extent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildInfoBar(context),
        ],
      ),
    );
  }

  Widget _buildInfoBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      height: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    'data',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ).animate()
                    .slideX(
                  begin: -1,
                  end: 0,
                  duration: 600.ms,
                  delay: 600.ms,
                  curve: Curves.easeOutQuad,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: _buildCircleAvatar(),
                ).animate()
                    .slideX(
                  begin: -1,
                  end: 0,
                  duration: 600.ms,
                  delay: 600.ms,
                  curve: Curves.easeOutQuad,
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate()
        .slideX(
      begin: -1,
      end: 0,
      duration: 600.ms,
      delay: 600.ms,
      curve: Curves.easeOutSine,
    );
  }


  Widget _buildCircleAvatar() {
    return Container(
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
      ),
    );
  }
}
