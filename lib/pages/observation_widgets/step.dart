import 'package:flutter/material.dart';

class CustomStep {
  int stepNumber;
  String title;
  Widget content;
  Function onNext;
  bool isFirst = false;
  bool isLast = false;
  bool proceed;
  String errorMsg;
  CustomStep(
      {this.stepNumber,
      this.title,
      this.content,
      this.onNext,
      this.isLast,
      this.isFirst,
      this.proceed,
      this.errorMsg});
}

class CustomStepper extends StatefulWidget {
  final List<CustomStep> customStepList;

  const CustomStepper({Key key, this.customStepList}) : super(key: key);
  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int currentPage = 0;
  bool showErrorMsg = false;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: controller,
        onPageChanged: (newPage) {
          currentPage = newPage;
        },
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: widget.customStepList.map((CustomStep step) {
          return customStep(step: step);
        }).toList());
  }

  Widget customStep({CustomStep step}) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              child: Text(
                '${step.stepNumber.toString()}. ${step.title}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(child: step.content),
            ),
            if (showErrorMsg)
              Text(
                step.errorMsg ?? '',
                style: TextStyle(color: Colors.red),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: !step.isFirst,
                  child: ElevatedButton(
                    onPressed: () {
                      currentPage--;
                      controller.animateToPage(
                        currentPage,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Row(
                      children: [Text('Back'), Icon(Icons.keyboard_arrow_up)],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (step.proceed) {
                      setState(() {
                        showErrorMsg = false;
                      });

                      currentPage++;
                      controller.animateToPage(
                        currentPage,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeIn,
                      );
                    } else {
                      setState(() {
                        showErrorMsg = true;
                      });
                    }
                  },
                  child: Row(
                    children: [
                      Text(step.isLast ? 'Submit' : 'Next'),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
