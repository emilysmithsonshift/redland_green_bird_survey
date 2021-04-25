import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/providers/sightings_type_provider.dart';

Widget ObservationDescription(Function onSelected, int _sightingType) {
  return Expanded(
    child: ListView.builder(
      itemCount: sightingsTypeList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            onSelected(index);
          },
          child: Container(
            constraints: BoxConstraints(minHeight: 50),
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: _sightingType == index
                  ? []
                  : [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(3.0, 3.0),
                        blurRadius: 3.0,
                      )
                    ],
              border: Border.all(
                width: _sightingType == index ? 2.0 : 0.0,
                color: Colors.blueAccent,
              ),
            ),
            child: Center(
              child: Text(
                sightingsTypeList[index].description,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    ),
  );
}
