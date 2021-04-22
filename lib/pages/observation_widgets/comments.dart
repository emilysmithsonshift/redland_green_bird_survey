import 'package:flutter/material.dart';

Widget Comments({Function onChanged, String comment}) {
  return Container(
    margin: const EdgeInsets.all(8),
    padding: const EdgeInsets.all(8),
    decoration: const BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(5.0, 5.0),
          blurRadius: 5.0,
        )
      ],
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: comment,
        onChanged: (value) {
          onChanged(value);
        },
      ),
    ),
  );
}
