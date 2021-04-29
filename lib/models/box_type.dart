class BoxType {
  String name;
  String description;
  String icon;
  String image;
  BoxType(this.name, this.description, this.icon, this.image);
  static final BoxType seville = BoxType(
      'Seville',
      'This 28mm hole nest box will be used by Tree Sparrows, Blue Tits, Coal Tits and Great Tits.',
      'assets/bird_boxes/seville.png',
      'assets/bird_boxes/seville.jpg');
  static final BoxType alicante = BoxType(
      'Alicante',
      'This 32mm hole nest box will be used by Great Tits, Pied Flycatchers, Tree Sparrows and House Sparrows.',
      'assets/bird_boxes/alicante.png',
      'assets/bird_boxes/alicante.jpg');
  static final BoxType alicanteOpen = BoxType(
    'Alicante Open Fronted',
    'This open nest box will be used by Robins and Wrens (if well hidden), Spotted Flycatchers, Pied and Grey Wagtails, Song Thrushes and Blackbirds.',
    'assets/bird_boxes/alicante_open.png',
    'assets/bird_boxes/alicante_open.jpg',
  );
  static final String generalBirdBoxDescription =
      'These boxes were purchased thanks to a generous grant from RCAS.'
      '\n\nThese attractive nestboxes are manufactured from WoodStone which is a mix of '
      'concrete and FSC certified wood fibres. Unlike a traditional wooden nest box, '
      'these boxes will not rot away or deteriorate and are guaranteed for 10 years. '
      '\n\nThis robust material safeguards against attacks from predators such as woodpeckers, '
      'cats and squirrels, whilst also providing a well insulated interior with a more '
      'consistent internal temperature than an ordinary wooden box. \n\nThis is especially '
      'important during the breeding season and ensures that young birds have a greater '
      'chance of survival. Nesting sites have become rare for cavity nesting birds due '
      'to changes in woodland management practices, so you can provide much-needed space '
      'for rearing chicks and birds that are roosting overwinter with these durable, long-lasting nest boxes.';
}
