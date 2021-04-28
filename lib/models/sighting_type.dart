class SightingType {
  int id;
  String description;
  SightingType(
    this.id,
    this.description,
  );
  static final sightingType0 =
      SightingType(0, 'No sign of any bird at bird box');

  static final sightingType1 =
      SightingType(1, 'Adult bird taking material out of bird box');
  static final sightingType2 = SightingType(2, 'Adult bird coming out of box');
  static final sightingType3 =
      SightingType(3, 'Adult bird flying into nest with food in mouth');
  static final sightingType4 =
      SightingType(4, 'Adult bird flying into nest without food in mouth');
  static final sightingType5 = SightingType(5, 'Adult bird flying into nest');
  static final sightingType6 = SightingType(6, 'Young birds fledging');
  static final sightingType7 = SightingType(7,
      'Predator (eg magpie, crow, green woodpecker, great spotted woodpecker, jay) at bird box');
  static final sightingType8 =
      SightingType(8, 'Adult bird carrying nesting materials into bird box');

  static final List<SightingType> sightingsTypeList = [
    sightingType0,
    sightingType1,
    sightingType2,
    sightingType3,
    sightingType4,
    sightingType5,
    sightingType6,
    sightingType7,
    sightingType8,
  ];
}
