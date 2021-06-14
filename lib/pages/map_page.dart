import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong/latlong.dart';
import 'package:redland_green_bird_survey/models/bird_box.dart';
import 'package:redland_green_bird_survey/pages/bird_box_page.dart';

bool mapSatellite = false;

class MapPage extends StatefulWidget {
  final int birdBox;

  const MapPage({Key key, this.birdBox}) : super(key: key);
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final List<Marker> _markers = [];
  MapController mapController = MapController();

  bool permissionGranted = false;
  final PopupController _popupController = PopupController();

  @override
  void initState() {
    if (widget.birdBox != null) {
      int i = widget.birdBox;
      final Marker _marker = MapMarker(birdBox: BirdBox.birdBoxesList[i]);
      _markers.add(_marker);
    } else {
      for (int i = 0; i < BirdBox.birdBoxesList.length; i++) {
        final Marker _marker = MapMarker(birdBox: BirdBox.birdBoxesList[i]);
        _markers.add(_marker);
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _googleMap() {
      return FlutterMap(
        mapController: mapController,
        options: MapOptions(
          maxZoom: 18,
          onTap: (_) {
            _popupController.hidePopup();
          },
          plugins: [
            PopupMarkerPlugin(),
            MarkerClusterPlugin(),
            LocationMarkerPlugin(),
          ],
          center: widget.birdBox != null
              ? BirdBox.birdBoxesList[widget.birdBox].location
              : LatLng(51.474508, -2.608220),
          zoom: 17.0,
        ),
        layers: [
          if (mapSatellite)
            TileLayerOptions(
              urlTemplate:
                  'https://api.mapbox.com/styles/v1/emilysmithson/ckpwmhnk55h4118ntjfm8rnm3/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZW1pbHlzbWl0aHNvbiIsImEiOiJja3B3bWNha3owMjNxMm9tY2FvZDc2Z3FuIn0.0nSebTuCenuV6ecgIGiwLg',
            ),
          if (!mapSatellite)
            TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
          MarkerLayerOptions(markers: _markers),
          LocationMarkerLayerOptions(),
          MarkerClusterLayerOptions(
            maxClusterRadius: 0,
            markers: _markers,
            popupOptions: PopupOptions(
              popupController: _popupController,
              popupBuilder: (BuildContext context, Marker marker) {
                return PopUp(marker: marker);
              },
            ),
            builder: (context, markers) {
              return FloatingActionButton(
                heroTag: null,
                child: Text(markers.length.toString()),
                onPressed: null,
              );
            },
          ),
        ],
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
        extendBodyBehindAppBar: Platform.isIOS,
        body: _googleMap());
  }
}

class MapMarker extends Marker {
  BirdBox birdBox;
  MapMarker({
    this.birdBox,
  }) : super(
          anchorPos: AnchorPos.align(AnchorAlign.top),
          point: birdBox.location,
          builder: (BuildContext ctx) => Icon(
            Icons.location_pin,
            color: mapSatellite ? Colors.green : Colors.black,
          ),
        );
}

class PopUp extends StatefulWidget {
  final MapMarker marker;

  const PopUp({Key key, this.marker}) : super(key: key);
  @override
  _PopUpState createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BirdBoxPage(
              birdBox: widget.marker.birdBox,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.green[50],
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: ListTile(
            leading: Hero(
                tag: 'starling',
                child: ClipOval(
                    child: Image.asset(widget.marker.birdBox.boxType.image))),
            title: Text('Bird Box ${widget.marker.birdBox.id}'),
            subtitle: Text(widget.marker.birdBox.locationDescription),
          ),
        ),
      ),
    );
  }
}
