import 'package:redland_green_bird_survey/model/main_model.dart';

class Birds {
  static final Bird robin = Bird('Robin', '',
      ['assets/robin_close.png', 'assets/robin1.png', 'assets/robin.png']);
  static final Bird greatTit = Bird(
    'Great Tit',
    'A colourful mix of blue, yellow, white and green makes the blue tit one of our most attractive and most recognisable garden visitors. In winter, family flocks join up with other tits as they search for food. A garden with four or five blue tits at a feeder at any one time may be feeding 20 or more.',
    [
      'assets/greattit_close.png',
    ],
  );
  static final Bird blueTit = Bird('Blue Tit', '', [
    'assets/bluetit_close.png',
    'assets/bluetit3.png',
    'assets/bluetit.jpg',
    'assets/bluetit2.png'
  ]);
  static final Bird blackbird = Bird('Blackbird', '', [
    'assets/blackbird_close.png',
    'assets/blackbird1.png',
    'assets/blackbird2.png'
  ]);
  static final Bird songThrush = Bird('Song Thrush', '',
      ['assets/songthrush_close.png', 'assets/songthrush.png']);
  static final Bird nuthatch = Bird('Nuthatch', '', [
    'assets/nuthatch_close.png',
    'assets/nuthatch.png',
    'assets/nuthatch1.png'
  ]);
  static final Bird dunnock = Bird('Dunnock', '', [
    'assets/dunnock1.png',
    'assets/dunnock_close.png',
    'assets/dunnock.png',
  ]);
  static final Bird wren = Bird('Wren', '', [
    'assets/wren_close.png',
    'assets/wren.png',
    'assets/wren2.png',
    'assets/wren3.png'
  ]);
  static final Bird unknown = Bird(
    'Unknown',
    '',
    [],
  );
  static final Bird other = Bird(
    'Other',
    '',
    [],
  );
  static final Bird unidentified = Bird(
    'Unidentified',
    '',
    [],
  );
  static final Bird none = Bird(
    'None',
    '',
    [],
  );
  static final Bird starling = Bird('Starling', '', [
    'assets/starling.png',
    'assets/starling2.png',
  ]);
  static final Bird wagtail = Bird(
    'Wagtail',
    '',
    [
      'assets/wagtail2.png',
      'assets/wagtail1.png',
      'assets/wagtail.png',
    ],
  );
  static final Bird crow = Bird('Crow', '', [
    'assets/crow.png',
    'assets/crow1.png',
    'assets/crow2.png',
    'assets/crow3.png',
    'assets/crow4.png',
  ]);
  static final Bird jay = Bird('Jay', '', [
    'assets/jay.png',
  ]);
  static final Bird coaltit = Bird('Coaltit', '', [
    'assets/coaltit.png',
  ]);
  static final Bird goldfinch = Bird('GoldFinch', '', [
    'assets/goldfinch.png',
    'assets/goldfinch2.png',
    'assets/goldfinch3.png',
  ]);
  static final Bird longtailedtit = Bird('Long-tailed Tit', '', [
    'assets/longtailedtit.png',
    'assets/longtailedtit2.png',
    'assets/longtailedtit3.png',
  ]);
  static final Bird magpie = Bird('Magpie', '', [
    'assets/magpie.png',
  ]);
  static final Bird woodpecker = Bird('Woodpecker', '', [
    'assets/woodpecker.png',
  ]);
  static final List<Bird> birdsList = [
    robin,
    greatTit,
    blueTit,
    blackbird,
    songThrush,
    nuthatch,
    wren,
    starling,
    dunnock,
    wagtail,
    crow,
    jay,
    coaltit,
    goldfinch,
    longtailedtit,
    magpie,
    woodpecker,
    other,
    unidentified,
    none
  ];
}
