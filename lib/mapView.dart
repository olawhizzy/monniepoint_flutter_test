import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'common.dart';

class MapView extends StatelessWidget {
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
          markers: _createMarkers(),
        ),
        Positioned(
          top: 40,
          left: 20,
          right: 20,
          child: SearcheBar(),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: FilterButton(),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: ListButton(),
        ),
      ],
    );
  }

  Set<Marker> _createMarkers() {
    return {
      Marker(
        markerId: MarkerId('marker_1'),
        position: LatLng(59.9311, 30.3609),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ),
      // Add more markers as needed
    };
  }
}