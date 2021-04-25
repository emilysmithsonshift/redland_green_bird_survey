import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/providers/birds_provider.dart';

Widget SelectBird(int _bird, Function onSelect) {
  return Expanded(
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: birdsList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            onSelect(index);
          },
          child: Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.green[50],
              border: Border.all(
                width: _bird == index ? 3.0 : 0.0,
                color: Colors.blueAccent,
              ),
              boxShadow: _bird == index
                  ? []
                  : [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(3.0, 3.0),
                        blurRadius: 3.0,
                      )
                    ],
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                colorFilter: birdsList[index].image.isEmpty
                    ? const ColorFilter.mode(Colors.grey, BlendMode.clear)
                    : const ColorFilter.mode(Colors.white, BlendMode.colorBurn),
                fit: BoxFit.fill,
                image: AssetImage(birdsList[index].image.isEmpty
                    ? 'assets/bluetit.png'
                    : birdsList[index].image[0]),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.white60,
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  birdsList[index].name,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
