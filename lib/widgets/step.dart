import 'package:flutter/material.dart';

Widget step({
  int? stepNumber,
  required String title,
  String? subtitle,
  required Widget content,
  Function? onNext,
  Function? onBack,
  required bool showPrevious,
  String? nextButtonText,
  BuildContext? context,
  required bool showErrorMsg,
  String? errorMsg,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
          child: Row(
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
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        Text(subtitle ?? ''),
        Expanded(child: content),
        showErrorMsg
            ? Text(
                errorMsg!,
                style: const TextStyle(color: Colors.red),
              )
            : const Text(''),
        SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (showPrevious)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      onBack!();
                    },
                    child: const Text('Back'),
                  ),
                ),
              ElevatedButton(
                onPressed: () {
                  onNext!();
                },
                child: Text(nextButtonText ?? 'Next'),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
