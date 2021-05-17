import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/settings.dart';

class RGGridTile extends StatelessWidget {
  final String text;
  final String imageAsset;
  final Widget navigateTo;
  final String heroTag;
  final Function setState;

  const RGGridTile({
    Key key,
    this.text,
    this.imageAsset,
    this.navigateTo,
    this.heroTag,
    this.setState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: defaultBoxDecoration(),
      margin: const EdgeInsets.all(8.0),
      child: OpenContainer(
          transitionDuration: Duration(milliseconds: 750),
          closedShape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          closedColor: Colors.green[100],
          openBuilder: (context, action) {
            return navigateTo;
          },
          closedBuilder: (context, action) {
            return Container(
              width: 200,
              height: 200,
              // margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                //   borderRadius: const BorderRadius.all(
                //     Radius.circular(20.0),
                //   ),
                //
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    imageAsset,
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  // height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Colors.white60,
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
