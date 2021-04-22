import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/providers/birdboxes_provider.dart';

Widget SelectBirdBoxNo(
  Function onSelect,
  int birdBox,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Wrap(
          children: birdBoxesList.map((_birdBox) {
        return GestureDetector(
          onTap: () {
            onSelect(_birdBox.id - 1);
          },
          child: ClipOval(
            child: Container(
              height: 30,
              width: 30,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: const BorderRadius.all(
                  Radius.circular(60),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(3.0, 3.0),
                    blurRadius: 3.0,
                  )
                ],
                border: Border.all(
                  width: birdBox == _birdBox.id - 1 ? 2.0 : 0.0,
                  color: Colors.blueAccent,
                ),
              ),
              child: Center(
                child: Text(
                  _birdBox.id.toString(),
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
                  child: const Text(
                      'Tap here to see the map of where all the bird boxes are located'))
              : Text(birdBoxesList[birdBox].locationDescription),
        ),
      ),
    ],
  );
}
