import 'package:flutter/material.dart';

Widget rGCard(String text, String imageAsset) {
  return Container(
    height: 200,
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
      boxShadow: [
        new BoxShadow(
          color: Colors.grey,
          offset: new Offset(5.0, 5.0),
          blurRadius: 5.0,
        )
      ],
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          imageAsset,
        ),
      ),
    ),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
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
  );
}
