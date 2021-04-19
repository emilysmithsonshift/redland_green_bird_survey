import 'package:flutter/material.dart';

class RGGridTile extends StatelessWidget {
  final String text;
  final String imageAsset;
  final Widget navigateTo;
  final String heroTag;

  const RGGridTile(
      {Key key, this.text, this.imageAsset, this.navigateTo, this.heroTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag ?? '',
      child: Container(
        height: 200,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(5.0, 5.0),
              blurRadius: 5.0,
            )
          ],
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(
              imageAsset,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 30,
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
            ),
          ),
        ),
      ),
    );
  }
}
