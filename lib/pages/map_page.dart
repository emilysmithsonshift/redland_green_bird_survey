import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:redland_green_bird_survey/providers/birdboxes_provider.dart';

import 'bird_box_page.dart';
// import 'package:user_location/user_location.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Map<String, Marker> _markers = {};
  bool mapSatellite = true;
  @override
  void initState() {
    for (int i = 0; i < birdBoxesList.length; i++) {
      final Marker _marker = Marker(
        markerId: MarkerId(
          birdBoxesList[i].id.toString(),
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        // icon: customIcon,
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BirdBoxPage(
                    birdBox: birdBoxesList[i],
                  ),
                ),
              );
            },
            title: 'BirdBox ${birdBoxesList[i].id.toString()}',
            snippet: birdBoxesList[i].locationDescription),
        position: birdBoxesList[i].location,
      );
      _markers[birdBoxesList[i].id.toString()] = _marker;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _googleMap() {
      return GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        mapType: mapSatellite ? MapType.hybrid : MapType.normal,
        markers: _markers.values.toSet(),
        initialCameraPosition: const CameraPosition(
          target: LatLng(51.474508, -2.608220),
          zoom: 17,
        ),
      );
    }

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green[100],
          onPressed: () {
            setState(() {
              mapSatellite = !mapSatellite;
            });
          },
          child: Icon(mapSatellite ? Icons.map_outlined : Icons.satellite,
              color: Colors.black),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 240,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Hero(
                      tag: 'map_page',
                      child: Image.asset('assets/longtailedtit.png',
                          alignment: Alignment.topLeft, fit: BoxFit.cover),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Map',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ))
                ],
              ),
            ),
            Expanded(
              child: _googleMap(),
            ),
          ],
        ));
  }
}
