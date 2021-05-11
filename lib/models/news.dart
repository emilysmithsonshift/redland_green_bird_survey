import 'package:firebase_database/firebase_database.dart';

class News {
  String title;
  String headline;
  String body;
  String url;
  String photo;
  DateTime dateTime;
  String photoCaption;

  News({
    this.title,
    this.body,
    this.headline,
    this.dateTime,
    this.url,
    this.photo,
    this.photoCaption,
  });

  static setNews() {
    addNews(
      News(
          title: 'All Bird Boxes Cleaned out.',
          body:
              "Redland Green Community Group members cleaned out all the bird boxes in readiness for the new breeding season. "
              "\n\nThis included removing last year's nests. "
              "\n\nThis is important as the birds make new nests and would otherwise have to clean out the nest boxes themselves. "
              "\n\nSmall birds build news nests each year so this gives them a head start."
              "\n\nIt is also important to remove any other inhabitants such as insects, to give the birds a clean start. "
              "\n\n for the breeding season of 2020, the first since the boxes were installed in Redland Green, seven of the boxes contained complete nests and three had partial nests."
              "\n\nThe nests had all been occupied by Blue Tits or Great Tits.",
          dateTime: DateTime(2021, 2, 26),
          photo:
              "https://lh5.googleusercontent.com/axw13TZVpMKy3meuY3FFVeglvSQg7k2pz99j4csYj5iemGqEaw-UD6B20juEvABCkjohW0ooOg2MvN3jnJPXzA9jAldpYY6viDxep8V3kguroMj435O8J0lMUseG8Z71Mg=w1280",
          photoCaption:
              'This is a moss and wool-decorated example from one of the removed nests.',
          url: '',
          headline:
              'The bird boxes have all been thoroughly cleaned ready for the new season.'),
    );
    addNews(
      News(
          title: 'Blue tit captured at box number 4',
          body:
              'Local resident Stephen Pill captured this fabulous photo of a blue tit flying in and out of box number 4.',
          dateTime: DateTime(2021, 5, 4),
          photo:
              'https://lh3.googleusercontent.com/N253vAirA-BuN_nAI-Ld3Eq-5ty3SwnEoAPC35432x3YmvRxmcPcIISsixbQRnjJOGGiPrrnJ_sp1LBt1aTG15fM9y8JvM4orH89iGDEG0PUy32PTtE-j3q3Ob8_K2D6sw=w1280',
          url: '',
          headline:
              'Local resident captures photo of blue tit flying out of bird box.'),
    );
  }

  static List<News> newsList = [
    News(
        title: 'All Bird Boxes Cleaned out.',
        body:
            "Redland Green Community Group members cleaned out all the bird boxes in readiness for the new breeding season. "
            "\n\nThis included removing last year's nests. "
            "\n\nThis is important as the birds make new nests and would otherwise have to clean out the nest boxes themselves. "
            "\n\nSmall birds build news nests each year so this gives them a head start."
            "\n\nIt is also important to remove any other inhabitants such as insects, to give the birds a clean start. "
            "\n\n for the breeding season of 2020, the first since the boxes were installed in Redland Green, seven of the boxes contained complete nests and three had partial nests."
            "\n\nThe nests had all been occupied by Blue Tits or Great Tits.",
        dateTime: DateTime(2021, 2, 26),
        photo:
            "https://lh5.googleusercontent.com/axw13TZVpMKy3meuY3FFVeglvSQg7k2pz99j4csYj5iemGqEaw-UD6B20juEvABCkjohW0ooOg2MvN3jnJPXzA9jAldpYY6viDxep8V3kguroMj435O8J0lMUseG8Z71Mg=w1280",
        photoCaption:
            'This is a moss and wool-decorated example from one of the removed nests.',
        url: '',
        headline:
            'The bird boxes have all been thoroughly cleaned ready for the new season.'),
    News(
        title: 'Blue tit captured at box number 4',
        body:
            'Local resident Stephen Pill captured this fabulous photo of a blue tit flying in and out of box number 4.',
        dateTime: DateTime(2021, 5, 4),
        photo:
            'https://lh3.googleusercontent.com/N253vAirA-BuN_nAI-Ld3Eq-5ty3SwnEoAPC35432x3YmvRxmcPcIISsixbQRnjJOGGiPrrnJ_sp1LBt1aTG15fM9y8JvM4orH89iGDEG0PUy32PTtE-j3q3Ob8_K2D6sw=w1280',
        url: '',
        headline:
            'Local resident captures photo of blue tit flying out of bird box.'),
  ];
  static void addNews(News _news) {
    final DatabaseReference reference =
        FirebaseDatabase.instance.reference().child("news");
    final String newkey = reference.push().key;
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
        FirebaseDatabase.instance.reference().child("news");
    final DataSnapshot snapshot = await reference.once();

    newsList.clear();
    if (snapshot.value == null) {
      print('null');
      return true;
    }

    final returnedList = snapshot.value;
    returnedList.forEach((key, value) {
      newsList.add(
        News(
          title: value['title'],
          dateTime: DateTime.parse(value['dateTime']),
          headline: value['headline'],
          body: value['body'],
          url: value['url'],
          photo: value['photo'],
          photoCaption: value['photoCaption'],
        ),
      );
    });
    newsList.sort((News a, News b) => b.dateTime.compareTo(a.dateTime));
    return true;
  }
}
