import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:proj4dart/proj4dart.dart' as proj4;
import 'package:redland_green_bird_survey/providers/birdboxes_provider.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';
// import 'package:user_location/user_location.dart';

class MapPage extends StatefulWidget {
  MapPage();

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapController mapController = MapController();
  // UserLocationOptions userLocationOptions;

  String initText = 'coordinates: ';
  bool treeInfoOpen = false;
  proj4.Point point = proj4.Point(x: 65.05166470332148, y: -19.171744826394896);

  List _markers = List<Marker>();

  @override
  void initState() {
    for (int i = 0; i < BirdBoxes.birdBoxesList.length; i++) {
      _markers.add(Marker(
          point: BirdBoxes.birdBoxesList[i].location,
          builder: (context) {
            return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => BirdBoxInformation(i)),
                  // );
                },
                child: Icon(Icons.location_pin));
          }));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    userLocationOptions = UserLocationOptions(
//      context: context,
//      mapController: mapController,
//      markers: markers1,
//      zoomToCurrentLocationOnLoad: false,
//      updateMapLocationOnPositionChange: false,
//      showMoveToCurrentLocationFloatingActionButton: true,
//    );
//     userLocationOptions = UserLocationOptions(
//         context: context,
//         mapController: mapController,
//         markers: _markers,
//         defaultZoom: 17,
//         zoomToCurrentLocationOnLoad: false,
//         updateMapLocationOnPositionChange: false);

    return PageTemplate(
        title: 'Map',
        image: 'assets/robin.png',
        heroTag: 'map',
        widgetList: [
          SizedBox(
            height: 800,
            child: FlutterMap(
              options: MapOptions(
                // plugins: [
                //   UserLocationPlugin(),
                // ],
                center: LatLng(51.474612, -2.607909),
                zoom: 16.65,
                maxZoom: 19,
                onTap: (p) => setState(() {
                  initText = 'You clicked at';

                  point = proj4.Point(x: p.latitude, y: p.longitude);
                  if (treeInfoOpen) {
                    _markers.removeLast();
                    treeInfoOpen = false;
                  }
                }),
              ),
              mapController: mapController,
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                  tileProvider: NonCachingNetworkTileProvider(),
                ),
                MarkerLayerOptions(markers: _markers),
                // userLocationOptions,
              ],
            ),
          ),
        ]);
  }
}
