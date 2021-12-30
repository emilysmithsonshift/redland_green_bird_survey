import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/news.dart';
import 'package:redland_green_bird_survey/widgets/news_widget.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: 'Latest News',
      image: 'assets/longtailedtit2.png',
      heroTag: 'latestNews',
      widgetList:
          News.newsList.map((News news) => NewsWidget(news: news)).toList(),
    );
  }
}
