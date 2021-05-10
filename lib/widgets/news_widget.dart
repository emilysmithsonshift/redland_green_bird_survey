import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/news.dart';

import '../settings.dart';

class NewsWidget extends StatelessWidget {
  final News news;

  const NewsWidget({Key key, this.news}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: defaultBoxDecoration(color: Colors.green[50]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(news.title, style: Theme.of(context).textTheme.headline1),
                Text(news.body),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
