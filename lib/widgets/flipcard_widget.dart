import 'dart:math';

import 'package:flutter/material.dart';

import '../settings.dart';

class FlipCardWidget extends StatefulWidget {
  final String question;
  final String answer;
  final String image;

  const FlipCardWidget({Key key, this.question, this.answer, this.image})
      : super(key: key);
  @override
  _FlipCardWidgetState createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(end: 1, begin: 0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
    super.initState();
  }

  Widget _widget() {
    return Container(
      decoration: defaultBoxDecoration(),
      margin: EdgeInsets.symmetric(vertical: 8),
      width: 400,
      height: 200,
      child: (_animation.value < 0.5)
          ? ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(widget.image, fit: BoxFit.cover),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      color: Colors.green[50],
                      width: double.infinity,
                      height: double.infinity,
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.question,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.identity()..rotateY(pi),
                    child: Transform.scale(
                      scale: 1,
                      child: Text(widget.answer),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_animationStatus == AnimationStatus.dismissed) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      },
      child: Transform(
          transform: Matrix4.identity()
            // ..setEntry(3, 2, 0.02)
            ..rotateY(pi * _animation.value),
          alignment: FractionalOffset.center,
          child: _widget()),
    );
  }
}
