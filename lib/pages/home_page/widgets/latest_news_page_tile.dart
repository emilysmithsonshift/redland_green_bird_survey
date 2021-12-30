import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import '../../../models/news.dart';

class LatestNewsPageTile extends StatelessWidget {
  const LatestNewsPageTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return News.newsList.isEmpty
        ? const CircularProgressIndicator()
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Text('Latest News',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1),
                ),
              ),
              Expanded(
                child: Wrap(
                  spacing: 8.0, // gap between adjacent chips
                  runSpacing: 4.0,
                  children: News.newsList.map((news) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              Jiffy([
                                news.dateTime!.year,
                                news.dateTime!.month,
                                news.dateTime!.day
                              ]).format('do MMMM yyyy'),
                              style: Theme.of(context).textTheme.headline2,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              news.headline!,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          );
  }
}
