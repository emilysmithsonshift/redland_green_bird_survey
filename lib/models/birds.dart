enum BirdType { nesting, predator, other }

class Bird {
  String name;
  String scientificName;
  String birdFamily;
  String conservationStatus;
  String description;
  List<String> images;
  BirdType birdType;

  Bird({
    this.name,
    this.description,
    this.images,
    this.scientificName,
    this.birdFamily,
    this.conservationStatus,
    this.birdType,
  });

  static final Bird robin = Bird(
      name: 'Robin',
      description:
          "Friendly little birds with their distinctive red breasts and their beautiful song, robins are probably the most recognisable birds in Britain. "
          "\n\nJuvenile robins have brown breasts - they gain their red breasts after their first moult and each robin has a unique breast pattern."
          "\n\nThey are members of the thrush family and related to blackbirds and nightingales."
          "\n\nThey are territorial, do not usually travel far from where they were hatched and prefer to nest in open fronted bird boxes. "
          "\n\nA pair of robins can raise between three and five broods of chicks a year.",
      images: [
        'assets/robin_close.png',
        'assets/robin1.png',
        'assets/robin.png'
      ],
      conservationStatus: 'Green',
      scientificName: 'Erithacus rubecula',
      birdFamily: 'Old World flycatchers and chats',
      birdType: BirdType.nesting);
  static final Bird greatTit = Bird(
    name: 'Great Tit',
    description:
        'The largest UK tit with a colourful mix of blue, yellow, white and green makes the blue tit one of our most attractive and most recognisable garden visitors. '
        '\n\nIn winter, family flocks join up with other tits as they search for food. '
        '\n\nThey are woodland birds which have readily adapted to man-made habitats to become a familiar garden visitor.'
        '\n\nA great tit clutch can have between 5 and 11 eggs with the female doing all the incubation and the male helping with feeding the brood.',
    images: [
      'assets/greattit_close.png',
      'assets/greattit.png',
      'assets/greattit1.png',
    ],
    scientificName: 'Parus major',
    conservationStatus: 'Green',
    birdFamily: 'Tits',
    birdType: BirdType.nesting,
  );
  static final Bird blueTit = Bird(
    name: 'Blue tit',
    description:
        "A colourful mix of blue yellow, white and green makes the blue tit one of the most recognisable bird in Britain. "
        "\n\nThey are also one of the most common with around 15 million birds wintering in Britain and they provide a welcome"
        "sight on a dreary winter's day."
        "\n\nBlue tit numbers have been increasing in recent years and this may well be down to the provision of bird boxes and feeders"
        " which they have readily adapted to."
        "\n\nTheir beautiful plumage is thought to get brighter with every moult"
        " so they actually get more colourful as they age."
        "\n\nThey have a fairly distinctive 'teacher-teacher' call but they also have a great"
        "number of other calls. ",
    images: [
      'assets/bluetit_close.png',
      'assets/bluetit3.png',
      'assets/bluetit2.png',
      'assets/bluetit.jpg',
      'assets/bluetit4.png',
    ],
    scientificName: 'Cyanistes caeruleus',
    conservationStatus: 'Green',
    birdFamily: 'Tits',
    birdType: BirdType.nesting,
  );
  static final Bird blackbird = Bird(
    name: 'Blackbird',
    description:
        "One of the most populous birds in the British Isles the blackbird is just as at home "
        "in a town park, a suburban garden or a remote wood. It’s estimated there are over 5 million breeding pairs in the UK. "
        "\n\nMales are black with an orange-yellow beak and eye ring, whilst confusingly "
        "females are actually dark brown, often with paler streaks and spots on their breasts. "
        "\n\nThe song of the black bird is thought to be the most beautiful and best-loved "
        "of any British bird. It is a rich song, which is part learned and part improvised."
        " They typically like to sing after rain. They eat worms, insects, berries and fruit."
        " \n\nThe birds are 24-25cm in length and weigh between 80-100g"
        "\n\nIt takes a pair of blackbirds between 11 and 14 days to make a nest with most"
        "of the work being done by the female.",
    images: [
      'assets/blackbird_close.png',
      'assets/blackbird1.png',
      'assets/blackbird2.png',
    ],
    scientificName: 'Turdus merula',
    birdFamily: 'Thrushes',
    conservationStatus: 'Green',
    birdType: BirdType.other,
  );
  static final Bird songThrush = Bird(
    name: 'Song Thrush',
    description:
        "Song Thrushes can be distinguished by their beautifully patterned breast. "
        "\n\nTheir numbers are in huge decline, especially in towns and cities."
        "\n\nThey like to eat snails which they break by smashing them against a stone with a flick of the head."
        "\n\nMost song thrush pairs will have two or three broods a season."
        "\n\nTheir song pattern is quite distinctive as they like to repeat the same phrase"
        "several times.",
    images: [
      'assets/songthrush_close.png',
      'assets/songthrush.png',
    ],
    scientificName: 'Turdus philomelos',
    conservationStatus: 'Red',
    birdFamily: 'Thrushes',
    birdType: BirdType.other,
  );
  static final Bird nuthatch = Bird(
    name: 'Nuthatch',
    description:
        "The nuthatch has a distinctive black stripe on its head with a blueish grey"
        "top and a chestnut underside. "
        "\n\nTheir name is derived from nut hacker reflecting the bird's method"
        "of opening up nuts by jamming them into a crevice and then hammering at them."
        "\n\nThey have adapted to use bird tables and feeders and will take the food they find there"
        "and store it. This makes them very territorial. "
        "\n\nThey will readily adapt to bird boxes but they cannot resist plastering mud"
        "around the entrance hole."
        "\n\nThey are highly sedentary seldom moving far from where they hatched.",
    images: [
      'assets/nuthatch_close.png',
      'assets/nuthatch1.png',
      'assets/nuthatch2.png',
      'assets/nuthatch3.png',
    ],
    birdFamily: 'Nuthatches',
    conservationStatus: 'Green',
    scientificName: 'Sitta europaea',
    birdType: BirdType.other,
  );
  static final Bird dunnock = Bird(
      name: 'Dunnock',
      description:
          "Also known as a hedge sparrow, the dunnock is a small bird, about the size of a robin, "
          "that is a common sight in gardens, woodlands, hedgrows and parks."
          "\n\nThey are streaky brown and grey with a dark grey head and a thin bill."
          " \n\nMales and females will form strong pairs, but the female will still mate with another male, so neither male knows who the father is and both supply her chicks with food. "
          "\n\nThey nest in hedges or shrubs, laying up to five eggs.",
      images: [
        'assets/dunnock1.png',
        'assets/dunnock_close.png',
        'assets/dunnock.png',
      ],
      scientificName: 'Prunella modularis',
      conservationStatus: 'Amber',
      birdFamily: 'Accentors',
      birdType: BirdType.nesting);
  static final Bird wren = Bird(
    name: 'Wren',
    description:
        "Wrens are small, round, plumb birds withe a distinctive small tail which is usually cocked up."
        "\n\nDuring courtship they fan out their wings and tails."
        "\n\nThey hunt for insects amoung leaves on the ground  and in cracks in bark of trees."
        "\n\nFor such a small bird they emit a loud and slightly tremulous 'teet-teet-teet'."
        "\n\nThey can nest in any type of cavity from ground level upwards but they prefer the side of a tree, steep bank or wall."
        "\n\nThe nest is built by the male who may build several nests and install a different female in each one. "
        "\n\nThe nest is a stout dome structure made of leaves, grass and other plant materials which the female lines with feathers.",
    images: [
      'assets/wren_close.png',
      'assets/wren3.png',
      'assets/wren.png',
      'assets/wren2.png',
    ],
    birdFamily: 'Wrens',
    conservationStatus: 'Green',
    scientificName: 'Troglodytes troglodytes',
    birdType: BirdType.other,
  );

  static final Bird other = Bird(
    name: 'Other',
    description: '',
    images: [],
  );
  static final Bird unidentified = Bird(
    name: 'Unidentified',
    description: '',
    images: [],
  );
  static final Bird none = Bird(
    name: 'None',
    description: '',
    images: [],
  );
  static final Bird starling = Bird(
    name: 'Starling',
    description:
        "Smaller than blackbirds, Starlings appear black from a distance but are actually very glossy with a sheen of purples and greens."
        "\n\nThough once abundant, starlings are in huge decline and are now red-listed as a bird of concern."
        "\n\nThey are extremely sociable birds who like to feed and roost communally."
        "\n\nWinter roosts can hold anything from a few thousand to several million birds. "
        "\n\nBefore going to roost they indulge in impressive coordinate manoeuvres called murmations.",
    images: [
      'assets/starling.png',
      'assets/starling2.png',
      'assets/starling3.png',
      'assets/starling4.png',
      'assets/starling5.png',
    ],
    scientificName: 'Sturnus vulgaris',
    birdFamily: 'Starling',
    conservationStatus: 'Red',
    birdType: BirdType.other,
  );
  static final Bird wagtail = Bird(
    name: 'Pied Wagtail',
    description:
        "The pied wagtail can be seen dashing about on the grass on Redland Green in search of food with, as its name would suggest, "
        "its tail wagging up and down."
        "\n\nIts black and white markings make it easy to spot."
        "\n\nThough pied wagtails are almost exclusively British, they do not like the cold weather. In severe weather large "
        "numbers of up to 4000 wagtails will join together and roast communally.",
    images: [
      'assets/wagtail2.png',
      'assets/wagtail1.png',
      'assets/wagtail.png',
    ],
    conservationStatus: 'Green',
    birdFamily: 'Pipits and Wagtails',
    scientificName: 'Motacilla alba',
    birdType: BirdType.other,
  );
  static final Bird crow = Bird(
    name: 'Crow',
    description:
        "The all black carrion crow is one of the cleverest, most adaptable British birds."
        "\n\nTheir intellect is even thought to be comparable to chimpanzees."
        "\n\nThey make a very distinctive hoarse, cawing sound."
        "\n\nThey build big nests out of twigs, rags, bones and anything else they can find."
        "\n\nThey are generally solitary birds but the do work collectively to provide protection from predators and other intruders.",
    images: [
      'assets/crow.png',
      'assets/crow1.png',
      'assets/crow2.png',
      'assets/crow3.png',
      'assets/crow4.png',
    ],
    conservationStatus: 'Green',
    scientificName: 'Corvus corone',
    birdFamily: 'Crows',
    birdType: BirdType.predator,
  );
  static final Bird jay = Bird(
    name: 'Jay',
    description: 'Jays are the most colourful members of the crow family. '
        '\n\nThey are shy woodland birds rarely moving far from cover. '
        '\n\nThey make a distinctive screaming call when they are on the move.'
        '\n\nThey are particularly fond of acorns and in the autumn you can catch them burying their acorns ready for winter.',
    images: [
      'assets/jay.png',
    ],
    scientificName: 'Garrulus glandarius',
    birdFamily: 'Crows',
    conservationStatus: 'Green',
    birdType: BirdType.other,
  );
  static final Bird coaltit = Bird(
      name: 'Coal tit',
      description:
          "The coal tit has a distinctive grey back, black cap and white patch at the back of its neck. "
          "\n\nIn winter they form flocks with other tits."
          "\n\nThey have a song of repeated phrases that are similar to those the great tit but more high pitched.",
      images: [
        'assets/coaltit1.png',
        'assets/coaltit.png',
      ],
      conservationStatus: 'Green',
      scientificName: 'Periparus ater',
      birdFamily: 'Tits',
      birdType: BirdType.nesting);
  static final Bird goldfinch = Bird(
    name: 'GoldFinch',
    description:
        "Goldfinches are probably the most exotic birds you'll see on the Green. Thy have a bright red face and yellow wing patch. "
        "\n\nThey have a delightful twittering song and call."
        "\n\nTheir long fine beaks enable them to extract seeds from thistles and teasels. "
        "\n\nThey are increasingly using bird tables and feeders.",
    images: [
      'assets/goldfinch.png',
      'assets/goldfinch2.png',
      'assets/goldfinch3.png',
      'assets/goldfinch4.png',
    ],
    conservationStatus: 'Green',
    birdFamily: 'Finches',
    scientificName: 'Carduelis carduelis',
    birdType: BirdType.other,
  );
  static final Bird longtailedtit = Bird(
    name: 'Long-tailed Tit',
    description:
        "These adorable tiny birds with tails longer than their body is often seen in flocks of about 20 birds."
        "\n\nThey rove the woods and hedgerows and they can be quite noisy. "
        "\n\nTheir undulating flight is quite distinctive.",
    images: [
      'assets/longtailedtit.png',
      'assets/longtailedtit2.png',
      'assets/longtailedtit3.png',
    ],
    birdFamily: 'Long-tailed Tits',
    scientificName: 'Aegithalos caudatus',
    conservationStatus: 'Green',
    birdType: BirdType.other,
  );
  static final Bird magpie = Bird(
    name: 'Magpie',
    description:
        'Magpies are easily recognisable as fairly large black and white birds. '
        '\n\nUp close their plumage is very beautiful with a purplish blue iridescent sheen to the wing feathers and green gloss to the tail.',
    images: [
      'assets/magpie.png',
      'assets/magpie1.png',
      'assets/magpie3.png',
    ],
    birdFamily: 'Crows',
    scientificName: 'Pica pica',
    conservationStatus: 'Green',
    birdType: BirdType.predator,
  );
  static final Bird woodpecker = Bird(
    name: 'Woodpecker',
    description: '',
    images: [
      'assets/woodpecker.png',
    ],
    birdFamily: 'Woodpeckers',
    conservationStatus: 'Green',
    scientificName: 'Dendrocopos major',
    birdType: BirdType.predator,
  );

  // static final Bird pigeon = Bird(
  //   name: 'Pigeon',
  //   description: '',
  //   images: [
  //     'assets/pigeon.png',
  //   ],
  //
  // );
  static final List<Bird> birdsList = [
    blackbird,
    blueTit,
    coaltit,
    crow,
    dunnock,
    goldfinch,
    greatTit,
    jay,
    longtailedtit,
    magpie,
    nuthatch,
    robin,
    songThrush,
    starling,
    woodpecker,
    wagtail,
    wren,
    other,
    unidentified,
    none
  ];
}
