class BoxType {
  String name;
  String description;
  String icon;
  String image;
  BoxType(this.name, this.description, this.icon, this.image);
  static final BoxType seville = BoxType(
      'Seville',
      'This 28mm hole nest box is suitable for pied flycatcher, blue tits, coal tits and great tits.',
      'assets/bird_boxes/seville.png',
      'assets/bird_boxes/seville.jpg');
  static final BoxType alicante = BoxType(
      'Alicante',
      'This 32mm hole nest box is suitable for great tits, pied flycatchers and house sparrows.',
      'assets/bird_boxes/alicante.png',
      'assets/bird_boxes/alicante.jpg');
  static final BoxType alicanteOpen = BoxType(
    'Alicante Open Fronted',
    'This open nest box is suitable for robins and wrens (if well hidden), pied wagtails, song thrushes and blackbirds.',
    'assets/bird_boxes/alicante_open.png',
    'assets/bird_boxes/alicante_open.jpg',
  );
  static const String generalBirdBoxDescription =
      'These nestboxes are manufactured from WoodStone which is a mix of '
      'concrete and FSC certified wood fibres. Unlike a traditional wooden nest box, '
      'these boxes will not rot away or deteriorate and are guaranteed for 10 years. '
      '\n\nThis robust material safeguards against attacks from predators such as woodpeckers, '
      'cats and squirrels, whilst also providing a well insulated interior with a more '
      'consistent internal temperature than an ordinary wooden box. \n\nThis is especially '
      'important during the breeding season and ensures that young birds have a greater '
      'chance of survival. Nesting sites have become rare for cavity nesting birds as the result of '
      'changed woodland management practices, which have resulted in fewer ancient trees. '
      'Nest boxes provide a much needed alternative both for breeding birds and for birds which use them as winter roosting sites.'
      '\n\nThese boxes were purchased thanks to a generous grant from the Redland and Cotham Amenities Society (RCAS).';
}
