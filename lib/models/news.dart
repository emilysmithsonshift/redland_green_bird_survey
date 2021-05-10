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
            'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.theguardian.com%2Fenvironment%2F2020%2Fapr%2F22%2Fmystery-bird-illness-investigated-after-german-blue-tit-deaths&psig=AOvVaw2w3DOFRH3VAsqBUezxlw5R&ust=1620457551582000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMDx0_eAt_ACFQAAAAAdAAAAABAD',
        url: '',
        headline:
            'Local resident captures photo of blue tit flying out of bird box.'),
  ];
}
