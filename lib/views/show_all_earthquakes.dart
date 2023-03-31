import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class ShowAllEarthquakes extends StatefulWidget {
  const ShowAllEarthquakes({super.key});

  @override
  State<ShowAllEarthquakes> createState() => _ShowAllEarthquakesState();
}

class _ShowAllEarthquakesState extends State<ShowAllEarthquakes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(41.027847604064995, 28.953868125057234),
          zoom: 5
          ),
          mapType: MapType.normal,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
      ),


    );
  }
}