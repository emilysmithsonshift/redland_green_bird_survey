import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/birds.dart';

Widget SelectBird(int _bird, Function onSelect) {
  List<Bird> birdList =
      Bird.birdsList.where((bird) => bird.birdType != BirdType.other).toList();

  return Expanded(
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: birdList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print(birdList[index].id);
            onSelect(birdList[index].id);
          },
          child: Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.green[50],
              border: Border.all(
                width: _bird == birdList[index].id ? 3.0 : 0.0,
                color: Colors.blueAccent,
              ),
              boxShadow: _bird == birdList[index].id
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
                colorFilter: birdList[index].images.isEmpty
                    ? const ColorFilter.mode(Colors.grey, BlendMode.clear)
                    : const ColorFilter.mode(Colors.white, BlendMode.colorBurn),
                fit: BoxFit.fill,
                image: AssetImage(birdList[index].images.isEmpty
                    ? 'assets/bluetit.png'
                    : birdList[index].images[0]),
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
                  birdList[index].name,
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
