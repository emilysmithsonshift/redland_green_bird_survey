import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:redland_green_bird_survey/models/bird_box.dart';

import 'bird_box_page.dart';

class MapPage extends StatefulWidget {
  final int birdBox;

  const MapPage({Key key, this.birdBox}) : super(key: key);
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Map<String, Marker> _markers = {};
  bool mapSatellite = true;
  @override
  void initState() {
    if (widget.birdBox != null) {
      int i = widget.birdBox;
      final Marker _marker = Marker(
        markerId: MarkerId(
          BirdBox.birdBoxesList[i].id.toString(),
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        // icon: customIcon,
        infoWindow: InfoWindow(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BirdBoxPage(
                    birdBox: BirdBox.birdBoxesList[i],
                  ),
                ),
              );
            },
            title: 'BirdBox ${BirdBox.birdBoxesList[i].id.toString()}',
            snippet: BirdBox.birdBoxesList[i].locationDescription),
        position: BirdBox.birdBoxesList[i].location,
      );
      _markers[BirdBox.birdBoxesList[i].id.toString()] = _marker;
    } else {
      for (int i = 0; i < BirdBox.birdBoxesList.length; i++) {
        final Marker _marker = Marker(
          markerId: MarkerId(
            BirdBox.birdBoxesList[i].id.toString(),
          ),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
          // icon: customIcon,
          infoWindow: InfoWindow(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BirdBoxPage(
                      birdBox: BirdBox.birdBoxesList[i],
                    ),
                  ),
                );
              },
              title: 'BirdBox ${BirdBox.birdBoxesList[i].id.toString()}',
              snippet: BirdBox.birdBoxesList[i].locationDescription),
          position: BirdBox.birdBoxesList[i].location,
        );
        _markers[BirdBox.birdBoxesList[i].id.toString()] = _marker;
      }
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
        appBar: AppBar(
          backgroundColor: Colors.green[100].withOpacity(0.6),
          title: Text('Map'),
        ),
        extendBodyBehindAppBar: true,
        body: _googleMap());
  }
}
