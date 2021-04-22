import 'package:flutter/material.dart';

Widget step({
  int stepNumber,
  String title,
  String subtitle,
  Widget content,
  Function onNext,
  Function onBack,
  bool showPrevious,
  String nextButtonText,
  BuildContext context,
  bool showErrorMsg,
  String errorMsg,
}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height - 240,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green[50],
                    border: Border.all(width: 0.5, color: Colors.grey)),
                child: Center(
                  child: Text(
                    stepNumber.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
          Text(subtitle ?? ''),
          content,
          showErrorMsg
              ? Text(
                  errorMsg,
                  style: TextStyle(color: Colors.red),
                )
              : Text(''),
          SafeArea(
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              if (showPrevious)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      onBack();
                    },
                    child: Text('Back'),
                  ),
                ),
              ElevatedButton(
                  onPressed: () {
                    onNext();
                  },
                  child: Text(nextButtonText ?? 'Next'))
            ]),
          ),
        ],
      ),
    ),
  );
}
