import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget TimeOfObservation({DateTime dateTime, Function onSelected}) {
  return SizedBox(
    height: 200,
    child: CupertinoTheme(
      data: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      child: CupertinoDatePicker(
        minimumYear: 2020,
        initialDateTime: dateTime,
        maximumDate: DateTime.now(),
        onDateTimeChanged: (DateTime newDateTime) {
          onSelected(newDateTime);
        },
      ),
    ),
  );
}
