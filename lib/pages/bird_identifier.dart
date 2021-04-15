import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';
import 'package:redland_green_bird_survey/widgets/rg_grid_tile.dart';

class BirdIdentifierScreen extends StatefulWidget {
  @override
  _BirdIdentifierScreenState createState() => _BirdIdentifierScreenState();
}

class _BirdIdentifierScreenState extends State<BirdIdentifierScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetList = [
      SizedBox(
        height: 100,
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/bluetit.png')),
          ),
          title: Text('Blue Tit'),
        ),
      ),
      RGGridTile(
          text: 'View the latest observations ',
          imageAsset: 'assets/robin.png'),
    ];

    return PageTemplate(
      title: 'Identify Birds on the Green',
      image: 'assets/nuthatch.png',
      heroTag: 'nuthatch',
      widgetList: _widgetList,
    );
  }
}
