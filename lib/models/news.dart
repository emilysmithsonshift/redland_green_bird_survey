import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class News extends Equatable {
  final String title;
  final String headline;
  final String body;
  final String url;
  final String photo;
  final DateTime dateTime;
  final String photoCaption;

  const News({
    required this.title,
    required this.body,
    required this.headline,
    required this.dateTime,
    required this.url,
    required this.photo,
    required this.photoCaption,
  });

  static final newsList = ValueNotifier<List<News>>([]);

  static void addNews(News _news) {
    final DatabaseReference reference =
        FirebaseDatabase.instance.ref().child("news");
    final String newkey = reference.push().key!;
    reference.child(newkey).set({
      'title': _news.title,
      'headline': _news.headline,
      'body': _news.body,
      'url': _news.url,
      'photo': _news.photo,
      'dateTime': _news.dateTime.toIso8601String(),
      'photoCaption': _news.photoCaption,
    });
  }

  static Future<bool> getNews() async {
    final DatabaseReference reference =
        FirebaseDatabase.instance.ref().child("news");
    final DatabaseEvent databaseEvent = await reference.once();
    final Map<dynamic, dynamic>? returnedList =
        databaseEvent.snapshot.value as Map<dynamic, dynamic>?;
    newsList.value.clear();
    if (returnedList == null) {
      return true;
    }

    returnedList.forEach((key, value) {
      newsList.value.add(
        News(
          title: value['title'] ?? '',
          dateTime: DateTime.parse(value['dateTime']),
          headline: value['headline'] ?? '',
          body: value['body'] ?? '',
          url: value['url'] ?? '',
          photo: value['photo'] ?? '',
          photoCaption: value['photoCaption'] ?? '',
        ),
      );
    });
    newsList.value.sort((News a, News b) => b.dateTime.compareTo(a.dateTime));
    newsList.notifyListeners();
    return true;
  }

  @override
  List<Object> get props {
    return [
      title,
      headline,
      body,
      url,
      photo,
      dateTime,
      photoCaption,
    ];
  }
}
