import 'package:redland_green_bird_survey/model/main_model.dart';

class Birds {
  static final Bird robin = Bird('Robin', '', [
    'assets/robin_close.png',
    'assets/images/birds/robin2.jpg',
    'assets/images/birds/robin3.jpg'
  ]);
  static final Bird greatTit = Bird(
    'Great Tit',
    '',
    [
      'assets/greattit_close.png',
      'assets/bluetit_close.png',
      'assets/blackbird_close.png',
      'assets/nuthatch_close.png'
    ],
  );
  static final Bird blueTit =
      Bird('Blue Tit', '', ['assets/bluetit_close.png']);
  static final Bird blackbird =
      Bird('Blackbird', '', ['assets/blackbird_close.png']);
  static final Bird songThrush =
      Bird('Song Thrush', '', ['assets/songthrush_close.png']);
  static final Bird nuthatch =
      Bird('Nut Hatch', '', ['assets/nuthatch_close.png']);
  static final Bird wren = Bird('Wren', '', ['assets/wren_close.png']);
  static final Bird unknown = Bird('Unknown', '', []);
  static final Bird other = Bird('Other', '', []);
  static final Bird unidentified = Bird('Unidentified', '', []);
  static final Bird none = Bird('None', '', []);
  static final List<Bird> birdsList = [
    robin,
    greatTit,
    blueTit,
    blackbird,
    songThrush,
    nuthatch,
    wren,
    other,
    unidentified,
    none
  ];
}
