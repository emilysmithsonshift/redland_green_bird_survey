import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/bird_box.dart';

import '../map_page.dart';

Widget SelectBirdBoxNo(
  int birdBox,
  Function onSelect,
  BuildContext context,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Wrap(
          children: BirdBox.birdBoxesList.map((_birdBox) {
        return GestureDetector(
          onTap: () {
            onSelect(_birdBox.id);
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipOval(
              child: Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(60),
                  ),
                  boxShadow: birdBox != _birdBox.id
                      ? [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(3.0, 3.0),
                            blurRadius: 3.0,
                          )
                        ]
                      : [],
                  border: Border.all(
                    width: birdBox == _birdBox.id ? 2.0 : 0.0,
                    color: birdBox == _birdBox.id
                        ? Colors.blueAccent
                        : Colors.green[50],
                  ),
                ),
                child: Center(
                  child: Text(
                    _birdBox.id.toString(),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList()),
      SizedBox(
        height: 80,
        child: Center(
          child: birdBox == -1
              ? Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(3.0, 3.0),
                        blurRadius: 3.0,
                      )
                    ],
                    border: Border.all(
                      width: 0.0,
                      color: Colors.blueAccent,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MapPage(),
                        ),
                      );
                    },
                    child: const Text(
                        'Tap here to see the map of where all the bird boxes are located'),
                  ))
              : Text(BirdBox.birdBoxesList[birdBox - 1].locationDescription),
        ),
      ),
    ],
  );
}
