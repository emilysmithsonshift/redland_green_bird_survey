import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../models/news.dart';
import '../../../settings.dart';

class NewsWidget extends StatelessWidget {
  final News? news;

  const NewsWidget({Key? key, this.news}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(8),
            decoration: defaultBoxDecoration(color: Colors.green[50]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      Jiffy([
                        news!.dateTime.year,
                        news!.dateTime.month,
                        news!.dateTime.day
                      ]).format('do MMMM yyyy'),
                      // style: Theme.of(context).textTheme.headline2,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(news!.title,
                      style: Theme.of(context).textTheme.headline1),
                ),
                if (news!.body.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(news!.body),
                  ),
                if (news!.photo.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: news!.photo,
                    ),
                  ),
                if (news!.photoCaption.isNotEmpty)
                  Text(
                    news!.photoCaption,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
