import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'common.dart';

class MapView extends StatefulWidget {
  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> with SingleTickerProviderStateMixin {
  Set<Marker> _markers = {};
  late AnimationController _controller;
  late GoogleMapController _mapController;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _createMarkers();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  Future<void> _createMarkers() async {
    final BitmapDescriptor labelIcon = await _createLabelMarkerBitmap();
    final BitmapDescriptor customIcon = await _createCustomMarkerBitmap();

    final List<LatLng> markerLocations = [
      LatLng(59.9311, 30.3609),  // Original center point
      LatLng(59.9420, 30.3850),  // North-east
      LatLng(59.9250, 30.3350),  // South-west
      LatLng(59.9380, 30.3250),  // North-west
      LatLng(59.9180, 30.3780),  // South-east
      LatLng(59.9340, 30.4000),
    ];

    /*setState(() {
      _markers = markerLocations.asMap().entries.map((entry) => Marker(
        markerId: MarkerId('marker_${entry.key}'),
        position: entry.value,
        icon: customIcon,
      )).toSet();
    });*/
    for (int i = 0; i < markerLocations.length; i++) {
      final labelMarker = await _createMarkerBitmap('Location ${i + 1}', isLabel: true);
      final iconMarker = await _createMarkerBitmap('', isLabel: false);

      setState(() {
        _markers.add(Marker(
          markerId: MarkerId('marker_$i'),
          position: markerLocations[i],
          icon: labelMarker,
          onTap: () => _animateMarker(i, iconMarker),
        ));
      });
    }

  }

  Future<BitmapDescriptor> _createMarkerBitmap(String label, {required bool isLabel}) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Colors.orange;

    const double size = 80;
    const double iconSize = 40;
    const double cornerRadius = 12;

    // Draw rounded square
    final Path path = Path()
      ..moveTo(0, cornerRadius)
      ..lineTo(0, size) // Bottom left corner is not rounded
      ..lineTo(size - cornerRadius, size)
      ..quadraticBezierTo(size, size, size, size - cornerRadius)
      ..lineTo(size, cornerRadius)
      ..quadraticBezierTo(size, 0, size - cornerRadius, 0)
      ..lineTo(cornerRadius, 0)
      ..quadraticBezierTo(0, 0, 0, cornerRadius);

    canvas.drawPath(path, paint);

    if (isLabel) {
      // Draw label text
      final textPainter = TextPainter(textDirection: TextDirection.ltr);
      textPainter.text = TextSpan(
        text: label,
        style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
      );
      textPainter.layout(maxWidth: size - 10);
      textPainter.paint(canvas, Offset((size - textPainter.width) / 2, (size - textPainter.height) / 2));
    } else {
      // Draw icon
      final iconPainter = TextPainter(textDirection: TextDirection.ltr);
      iconPainter.text = TextSpan(
        text: String.fromCharCode(Icons.home_work_outlined.codePoint),
        style: TextStyle(
          fontSize: iconSize,
          fontFamily: Icons.home_work_outlined.fontFamily,
          color: Colors.white,
        ),
      );
      iconPainter.layout();
      iconPainter.paint(canvas, Offset((size - iconPainter.width) / 2, (size - iconPainter.height) / 2));
    }

    final img = await pictureRecorder.endRecording().toImage(size.toInt(), size.toInt());
    final data = await img.toByteData(format: ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }

  Future<BitmapDescriptor> _createLabelMarkerBitmap() async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Colors.white;

    const double size = 120;
    const double padding = 8;

    // Draw rounded rectangle
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size, 40), Radius.circular(20)),
      paint,
    );

    // Draw text
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    textPainter.text = TextSpan(
      text: 'Location',
      style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(padding, (40 - textPainter.height) / 2));

    final img = await pictureRecorder.endRecording().toImage(size.toInt(), 40);
    final data = await img.toByteData(format: ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }

  Future<BitmapDescriptor> _createCustomMarkerBitmap() async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Colors.orange;

    const double size = 80;
    const double iconSize = 40;
    const double cornerRadius = 12;

    // Draw rounded square
    final Path path = Path()
      ..moveTo(0, cornerRadius)
      ..lineTo(0, size) // Bottom left corner is not rounded
      ..lineTo(size - cornerRadius, size)
      ..quadraticBezierTo(size, size, size, size - cornerRadius)
      ..lineTo(size, cornerRadius)
      ..quadraticBezierTo(size, 0, size - cornerRadius, 0)
      ..lineTo(cornerRadius, 0)
      ..quadraticBezierTo(0, 0, 0, cornerRadius);

    canvas.drawPath(path, paint);

    // Draw Font Awesome icon
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    textPainter.text = TextSpan(
      text: String.fromCharCode(Icons.home_work_outlined.codePoint),
      style: TextStyle(
        fontSize: iconSize,
        fontFamily: Icons.home_work_outlined.fontFamily,
        color: Colors.white,
      ),
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset((size - textPainter.width) / 2, (size - textPainter.height) / 2),
    );

    // Convert canvas to image
    final img = await pictureRecorder.endRecording().toImage(size.toInt(), size.toInt());
    final data = await img.toByteData(format: ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }

  void _animateMarker(int index, BitmapDescriptor customIcon) {
    setState(() {
      _markers = _markers.map((marker) {
        if (marker.markerId.value == 'marker_$index') {
          return marker.copyWith(iconParam: customIcon);
        }
        return marker;
      }).toSet();
    });
  }

  void _animateCamera() {
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(59.9311, 30.3609),
          zoom: 12,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(59.9311, 30.3609), // Saint Petersburg coordinates
            zoom: 12,
          ),
          mapType: MapType.normal,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          markers: _markers,
          onMapCreated: (GoogleMapController controller) {
            _mapController = controller;
            _animateCamera();
          },
        ),
        Positioned(
          top: 40,
          left: 20,
          right: 20,
          child: SearcheBar(),
        ),
        Positioned(
          bottom: 100,
          left: 20,
          child: FilterButton(),
        ),
        Positioned(
          bottom: 100,
          right: 20,
          child: ListButton(),
        ),
      ],
    ).animate(controller: _controller)
        .fadeIn(duration: 2500.ms)
        .then()
        .custom(
      duration: 3.5.seconds,
      builder: (context, value, child) => Opacity(
        opacity: 1,
        child: child,
      ),
    );
  }

}