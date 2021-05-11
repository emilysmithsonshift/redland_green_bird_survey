enum BirdType { nesting, predator, other }

class Bird {
  String name;
  String scientificName;
  String birdFamily;
  String conservationStatus;
  String description;
  List<String> images;
  BirdType birdType;
  int id;

  Bird({
    this.name,
    this.description,
    this.images,
    this.scientificName,
    this.birdFamily,
    this.conservationStatus,
    this.birdType,
    this.id,
  });

  static final Bird none = Bird(
    name: 'No bird seen',
    description: '',
    images: [],
    id: 0,
  );
  static final Bird other = Bird(
    name: 'Other',
    description: '',
    images: [],
    id: 1,
  );
  static final Bird unidentified = Bird(
    name: 'Unidentified',
    description: '',
    images: [],
    id: 2,
  );

  static final Bird robin = Bird(
    name: 'Robin',
    description:
        "The robin’s red breast, beautiful song and inquisitive behaviour make it one of the UK’s favourite birds. \n\nMales and females have the same appearance, and sing for most of the year in order to protect their territories, only ceasing to sing briefly in late summer, when they are moulting. They are extremely territorial and don’t tolerate intruders to their territories. They will also sing at night near street lights.\n\nJuveniles have speckled golden brown breasts, and gain their red breasts after their first moult. Each robin has an unique breast pattern.\n\nAbout 14cm long and 14-21g in weight, robins eat insects and invertebrates, worms, seeds and fruit. Robins and dunnocks have similar diets. In winter, when food is scarce, this results in competition between them. The robin will therefore often chase the dunnock out of its territory. \n\nRobins can have up to three, and maybe even four broods in a year, but each time they build a new nest, and so they will probably only use a nest box once in the same year. They are most likely to use an open-fronted nest box.\n\nIt’s estimated there are over 6.7 million breeding territories in the UK.",
    images: ['assets/robin_close.png', 'assets/robin1.png', 'assets/robin.png'],
    conservationStatus: 'Green',
    scientificName: 'Erithacus rubecula',
    birdFamily: 'Muscicapidae (Old World flycatchers & chats)',
    birdType: BirdType.nesting,
    id: 3,
  );
  static final Bird greatTit = Bird(
    name: 'Great Tit',
    description:
        "At 14cm long and weighing 18g, the great tit is the largest of the UK’s eight tit species. Males and females are alike, with blue grey wings and green backs. They have white cheeks and glossy black heads. The black continues as a thick stripe down the centre of their yellow chests and abdomen. The male’s stripe is thicker than the female’s, whose stripe is often discontinuous. The thicker the male’s stripe, the more attractive he is to the female as it indicates how good a father the bird will be.\n\nGreat tits eat insects, caterpillars, seeds and nuts. Like other tits, they prefer not to be out in the open for long: they are a woodland bird, but have readily moved into the gardens of built-up areas and have become familiar visitors to bird feeders. \n\nThe great tit has up to 40 types of calls and songs. The “teacher, teacher” call, used to assert a territory, is one of the most familiar. The female rarely calls. Individual males with large repertoires of songs and calls are more dominant birds, and also more successful breeders.\n\nNests are made from moss and grass, and lined with hair and feathers. Great tits will also readily use nest boxes. A clutch can be up to 15 eggs. Eggs, laid in April or May, are incubated by the female for about 2 weeks. Both parents feed the young after fledging. Occasionally great tits will have a second brood in the breeding season. Nests may sometimes contain blue tit eggs. It’s thought this might be because the great tit evicted a blue tit from a good nesting site, or perhaps it could be that a blue tit without a nest of its own has managed to lay eggs there. \n\nThere are estimated to be around 2.5 million breeding territories in the UK.",
    images: [
      'assets/greattit_close.png',
      'assets/greattit.png',
      'assets/greattit1.png',
    ],
    scientificName: 'Parus major',
    conservationStatus: 'Green',
    birdFamily: 'Paridae (tits)',
    birdType: BirdType.nesting,
    id: 4,
  );
  static final Bird blueTit = Bird(
    name: 'Blue tit',
    description:
        "Blue tits are among the most frequent visitors to our bird feeders and are also quite gregarious, visiting feeders in small groups. They eat insects, spiders, caterpillars, seeds and nuts. They are 12cm in length and 11g in weight – up to half the weight of robins. \n\nMales and females are striking birds, with their colourful mix of blue, yellow, white and green feathers. The blue cap on their head can be raised into a little crest. \n\nBlue tits are notable for their acrobatic skills, often hanging upside down while searching for food. \n\nLike all tits, blue tits usually nest in tree holes. They start prospecting for a place to nest as early as January. The female makes the nest from moss, grass, leaves, hair and spiders’ webs, lining them with feathers, fur or wool. Up to 16 eggs are usually laid from mid-April. The female incubates the eggs alone for 12-15 days, and the male brings her food. Both parents feed the young after fledging. A pair usually has only one brood in the year, but if food is plentiful, they may have a second brood. Sometimes, great tit eggs are found in blue tit nests.\n\nThe breeding population of the British Isles is around 3.5 million breeding territories, and the number of birds may increase to 15 million birds with over-wintering European blue tits. Blue tit numbers have been increasing in recent years, and this may be the result of bird boxes and feeders, to which they have readily adapted. Blue tits are probably the most common bird found in nest boxes.",
    images: [
      'assets/bluetit_close.png',
      'assets/bluetit3.png',
      'assets/bluetit.jpg',
      'assets/bluetit4.png',
      'assets/bluetit.png'
    ],
    scientificName: 'Cyanistes caeruleus',
    conservationStatus: 'Green',
    birdFamily: 'Paridae (tits)',
    birdType: BirdType.nesting,
    id: 5,
  );
  static final Bird blackbird = Bird(
    name: 'Blackbird',
    description:
        "One of the most populous birds in the British Isles, the blackbird is just at home in a town park, a suburban garden, or woodland. They eat worms, insects, berries and fruit, and can often be seen on lawns with their heads tilted to one side as they listen for earthworms.\n\nThe blackbird has a beautiful rich song, which is part learned and part improvised. Typically, they like to sing after rain, and sometimes sing at night, particularly if they are near street lights.\n\nMales are black with an orange-yellow beak and eye ring, while females are dark brown, often with paler streaks and spots on their breasts. The birds are 24-25cm in length and weigh between 80-100g. \n\nBlackbirds rear 2-3 broods a season, and may attempt a fourth brood in a good year. The same nest, made of plant material lined with mud and grass, is sometimes used for successive broods. A clutch is normally 3-5 eggs, and is incubated by the female. Hatching takes place 13-14 days after laying. Only the female broods the chicks, but both parents feed them.\n\nIt’s estimated there are over 5 million breeding pairs in the British Isles. In the autumn months, blackbird numbers are swelled by migrant blackbirds from Scandinavia and continental Europe. Some stay here for the winter; others continue further south.",
    images: [
      'assets/blackbird_close.png',
      'assets/blackbird1.png',
      'assets/blackbird2.png',
    ],
    scientificName: 'Turdus merula',
    birdFamily: 'Turdidae (Thrushes)',
    conservationStatus: 'Green',
    birdType: BirdType.nesting,
    id: 6,
  );
  static final Bird songThrush = Bird(
    name: 'Song Thrush',
    description:
        "The song thrush is about 23cm in length and 65-100g in weight. Both sexes have a rich brown head, wings and back, and a creamy breast covered in dark brown spots. \n\nAs the bird’s name suggests, their song is rich and beautiful, with a series of repeated phrases. Some males have up to 100 different phrases, partly learned from parents and partly acquired through mimicry, and so each bird’s song is different. They start singing in late winter and continue through into June or July. They are also one of the earliest birds to start singing in the morning, perhaps starting at around 3am. They sing again at dusk, and like to sing on prominent branches high up in a tree.\n\nSong thrushes eat invertebrates, earthworms, soft fruit and berries. When the earth is too hard to enable them to extract worms, they also eat snails, using a stone “anvil” to crack open the shell. This is a behaviour unique to the song thrush. \n\nWhile song thrushes will take food that is put out for them, such as windfall apples and mealworms, they are timid birds, easily chased away by birds such as the blackbird.\n\nSong thrush can have 2-3 broods a year, between March and August. They nest in trees and shrubs or among creepers on walls and often using the same nest for successive broods in the season. The nest, built by the female, is cup-shaped and, if in a tree, built close to the trunk. Nests are made of twigs, grass and moss, and are bonded together and lined with mud, dun, leaves and rotten wood. They can take three weeks to complete. \n\nThe female lays 3-5 eggs, at the rate of one per day. She starts to incubate after the last egg is laid, and broods until the chicks hatch after 13-15 days. Both parents feed the young. The chicks are ready to leave the nest at about 13-14 days old. Parents continue to feed the young birds until they can fend for themselves, about 3 weeks after fledging.\n\nIt’s thought there are about 1.2 million breeding territories in the UK, and the birds tend to stay in them the year round. The population declined more than 50% between 1970 and 1995, probably because of loss of habitat. More recently, there’s been a slight recovery in their numbers.",
    images: [
      'assets/songthrush_close.png',
      'assets/songthrush.png',
    ],
    scientificName: 'Turdus philomelos',
    conservationStatus: 'Red',
    birdFamily: 'Turdidae (Thrushes)',
    birdType: BirdType.nesting,
    id: 7,
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
    birdType: BirdType.nesting,
    id: 8,
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
      birdType: BirdType.other,
      id: 9);
  static final Bird wren = Bird(
    name: 'Wren',
    description:
        "The wren is a tiny 9-10cm in length and 7-12g in weight, though it’s not the UK’s smallest bird. \n\nIt is dark barred brown on the upper side and a lighter barred brown on the underside, with a pale, creamy eyebrow. Its short tail is frequently held upwards and often flicked. \n\nThey eat spiders and insects and use their long thin bill to probe crevices. This characteristic is what their name, troglodites (=cave-dweller) refers to. \n\nThe wren is more often heard than seen: it has a very loud voice for such a small bird, and doesn’t venture out into the open very much. \n\nWrens are cavity nesters, and will use both open-fronted and tit nest boxes for both nesting and winter roosting. The nest is dome or globe shaped, and made from leaves, twigs, grass and moss, lined with feathers. Wrens lay 5-8 eggs and may have a second brood. \n\nThey are resident year around. Severe winters may cause high mortality, but numbers generally recover as their breeding rates are high.\n\nIt’s estimated that there are over 8.6 million breeding territories in the UK which makes it the UK’s most common breeding bird.",
    images: [
      'assets/wren_close.png',
      'assets/wren3.png',
      'assets/wren.png',
      'assets/wren2.png',
    ],
    birdFamily: 'Troglodytidae (Wrens)',
    conservationStatus: 'Green',
    scientificName: 'Troglodytes troglodytes',
    birdType: BirdType.nesting,
    id: 10,
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
      'assets/starling4.png',
      'assets/starling5.png',
    ],
    scientificName: 'Sturnus vulgaris',
    birdFamily: 'Starling',
    conservationStatus: 'Red',
    birdType: BirdType.other,
    id: 11,
  );
  static final Bird wagtail = Bird(
    name: 'Pied Wagtail',
    description:
        "Pied wagtails, elegant and graceful, are 18cm long and 20-27g in weight, little bigger than a great tit. They are resident in the UK all year round. Their most distinctive characteristic is the wagging up and down of their long tails. \n\nIn the breeding season, male wagtails are striking birds with a black chest and back, and black and white head, wings and tail; however, males in non-breeding months are more grey, resembling the females. \n\nPied wagtails feed mainly on insects, especially caterpillars and flies, can be seen dashing around on grass and lawns in search of prey. They have become quite a common sight in retail car parks, also searching for food. They either catch insects on the ground, or as the insect embarks upon flight.\n\nOutside the breeding season, pied wagtails will roost communally at warm roost sites such as reed beds, or trees or bushes in cities. Some roosts contain up to 4000 birds.\n\nPied wagtails nest in holes in a wide variety of places, such as walls and buildings, under roofs and ivy and sometimes in very unlikely places such as farm machinery. The females build the nests out of mosses and grass, and line them with feathers, wool or hair. Normally, there are two broods per season, with 5-6 eggs. These are incubated mostly by the female, and hatch after about 13 days. \n\nThere are an estimated 470,000 breeding pairs in the UK.",
    images: [
      'assets/wagtail2.png',
      'assets/wagtail1.png',
      'assets/wagtail.png',
    ],
    conservationStatus: 'Green',
    birdFamily: 'Motacillidae (Pipits and wagtails)',
    scientificName: 'Motacilla alba',
    birdType: BirdType.nesting,
    id: 12,
  );
  static final Bird crow = Bird(
    name: 'Crow',
    description:
        "The carrion crow, or simply ‘crow’, is generally a solitary bird, seen alone or in pairs, and while generally fearless, it is wary of humans. It is about 45-47cm long and weighs 370-650g. Crows are entirely black, including their beaks, feet and legs, though the feathers on their heads, wings and backs have green and purple iridescences. Their thighs are neatly feathered.\n\nCrows are found in a wide variety of habitats, from woodlands to wetland and heathlands. They are intelligent, opportunistic and adaptable birds and have colonised cities readily. \n\nThey eat a range of foods including carrion, fruit, grain, invertebrates, small mammals, frogs, and the eggs and chicks of other birds. Their diet changes across the seasons, with predation upon eggs and chicks tending to be related to the need to feed their own young. As crows have only one clutch of eggs a season, predation on other birds is in general limited to the breeding season. However, crows will occasionally hunt together to predate other birds, sometimes catching them in flight. They will also harass other birds, or animals such as foxes, for their kills. Studies have found a crow’s diet can consist of over 1000 different food items.\n\nCarrion crows generally pair for life. They breed between late March and early June. Both birds build the nest, which may be in a variety of places (tree forks, old buildings, cliffs, and elsewhere) using an assortment of materials including twigs, bones and even wire. They reinforce the nests with mud, and line them with bark, wool, feathers, grass, paper, hair and other materials. They generally lay 3-4 eggs, which are incubated by the female for 18-20 days. The male feeds her during incubation. Both parents bring food to the chicks. The chicks fledge 4-5 weeks after hatching, and are dependent upon their parents for several more weeks.\n\nWhile crows have large territories centred upon their nests, neighbouring crows will sometimes co-operate to ‘mob’ or chase away potential predators or intruders. Crows maintain their territories year round, although they may depart overnight for communal roosts in winter. \n\nIt’s estimated that there are around 1 million breeding pairs in the UK, although they aren’t found in north and west Scotland or in Northern Ireland.",
    images: [
      'assets/crow.png',
      'assets/crow2.png',
      'assets/crow3.png',
      'assets/crow4.png',
    ],
    conservationStatus: 'Green',
    scientificName: 'Corvus corone',
    birdFamily: 'Corvidae (crows)',
    birdType: BirdType.predator,
    id: 13,
  );
  static final Bird jay = Bird(
    name: 'Jay',
    description:
        "The jay differs from other corvids in being extremely colourful. It has a pinkish body, black and white wings with a striking patch of banded blues, a white rump, black tail, black ‘moustache’ and pale chin. Its crown feathers are streaked black and white, and when it is displaying or excited, it can raise the feathers into a crest. Its length is around 35cm and weight 140-190g.\n\nThey are woodland birds, and shy of humans, preferring not to be seen. However, they are sociable and have many different calls, many of which mimic other birds, particularly other corvids. The call we are most likely to be familiar with is their harsh alarm call.\n\nJays have a mixed diet, eating seeds such as acorns and beech mast, fruit, insects, small rodents, bats, newts, birds’ eggs and young birds.\n\nJays are well known for caching food in autumn, particularly acorns, to eat in winter. They have good memories and are capable of retrieving several thousand acorns.\n\nMales and females usually pair for life. Both birds build a rather untidy nest of twigs in a tree or shrub, and line it with hairs, fibres and roots. They have one clutch of 4-5 eggs, which are incubated by the female. Both parents feed the young, which fledge at around 19-20 days. \n\nIt is estimated that there are 170,000 territories in the UK.",
    images: [
      'assets/jay.png',
    ],
    scientificName: 'Garrulus glandarius',
    birdFamily: 'Corvidae (crows)',
    conservationStatus: 'Green',
    birdType: BirdType.predator,
    id: 14,
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
      birdType: BirdType.other,
      id: 15);
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
    id: 16,
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
    id: 17,
  );
  static final Bird magpie = Bird(
    name: 'Magpie',
    description:
        "The magpie (or Eurasian magpie) is a very distinctive and handsome bird and one of the easiest corvids to identify. It is a pied, or black and white bird whose wing and tail feathers feature blue and blue-green-purple iridescence. Males and females look alike, but the female is slightly smaller. They are 44-46cm long with the tail accounting for over half of this length, and weigh 200-250g. They are very sociable and vocal birds.\n\nHowever, possibly more than any other bird, the magpie is associated with a range of mostly negative superstitions both across ages and in many different cultures. This could be because as scavengers, magpies have been associated with death, and because of that, with bad luck. The Victorians feared the magpie, and hunted it almost to extinction. It is also disliked because it predates the nests of other birds, particularly song birds.\n\nMagpies are omnivorous, and as well as predating nests and feeding on carrion and road kill, they eat invertebrates, fruit and berries and small mammals. They hoard food when it is scarce, hiding the food in a hole in the ground which they cover with leaves or grass.\n\nBoth birds make the nest, with the male collecting most of the materials for it. The nest is a large cup of twigs, grass, hair and mud, surrounded by a dome made from larger twigs, and with one or two entrances, although some birds don’t bother with domes. The nest, located in dense bushes or high up in trees, may take 5-6 weeks to make. The female lays around 5-8 eggs, which she incubates for around 19 days. The male feeds the female while she is brooding. The young fledge after about four weeks and continue to be fed by the parents for up to a month. The family stays together as a unit until the autumn. Young birds may form flocks, and feed and roost together.\n\nBreeding magpies maintain their territories all year round. As there are more individuals in an area than there are nesting sites available, many birds do not breed.\n\nIt’s estimated there are around 600,000 breeding territories in the UK.es are easily recognisable as fairly large black and white birds.\n\nUp close their plumage is very beautiful with a purplish blue iridescent sheen to the wing feathers and green gloss to the tail.'",
    images: [
      'assets/magpie.png',
      'assets/magpie1.png',
      'assets/magpie3.png',
    ],
    birdFamily: 'Corvidae (crows)',
    scientificName: 'Pica pica',
    conservationStatus: 'Green',
    birdType: BirdType.predator,
    id: 18,
  );
  static final Bird woodpecker = Bird(
    name: 'Great Spotted Woodpecker',
    description:
        "The great spotted woodpecker one of three woodpeckers native to Britain. It is a bird that is shy of humans, and so can be difficult to see. It is more commonly heard than seen.\n\nThis species is a broadleaved woodland specialist, but is very adaptable, and is also found in coniferous woodland, and parks and gardens where trees are plentiful. They particularly like oak and horn beam trees.\n\nThe great spotted woodpecker is a pied (black and white) woodpecker. At 21-23 cm long, it is about starling sized. It weights about 85 grams. The male and female are very similar, with a white underside, white and black back and wings and white cheeks and shoulder patches. Both male and female have a bright red underside at the base of the tail, but only the male has a red patch at the back of his neck. The nape of the female’s neck is white. Juveniles may be seen in summer: they are distinguished from their parents by having a red cap, which disappears after their first moult.\n\nThey have very strong claws for gripping the bark, and also use their stiff tail feathers as support when hopping up trees and gripping while chiselling and drumming. They have two toes which point frontwards, and two pointing backwards.\n\nThe great spotted woodpecker flight pattern is undulating. This is because it folds its wings against its body every few wing flaps.\n\nDead trees, rich in insect life, are an important location of food for them. The woodpecker probes both living and dead trees for larvae and insects, uses its powerful beak to hammer holes in the bark. Their extremely long and sticky tongues assist in extracting insects, spiders and caterpillars from crevices and holes. In winter they feed on nuts and berries, and will visit bird feeders for suet, peanuts and seeds throughout the year. Woodpeckers will take eggs and nestlings from nests, including from nest boxes. If nest boxes are made of wood, they will enlarge the size of the hole to gain entry.\n\nThe woodpecker is known for its drumming. This is a rapid hammering on a trunk of up to 20 times per second, which lasts a few seconds. Drumming serves several functions. It may be used to maintain contact between a pair, but its main function is to establish and proclaim a territory. The species is strongly territorial. The bird chooses a healthy tree on which to drum, in order to make the loudest sound. Both males and females drum from the late winter. The male drums more frequently than the female. Drumming usually ceases after the young have fledged.\n\nTerritorial and contact drumming are a more rapid drumming than that which characterises the bird’s nest-making chiselling.\n\nThe great spotted woodpecker nests in mature and old trees, excavating a hole in the trunk or branch by chiselling a cavity, and lining it with wood chip. It can take up to four weeks for a pair to chisel out a cavity, but the work is shared equally between male and female. The woodpeckers make a new nest hole every year, which means they have a significant ecological role in leaving many potential nest sites for other birds and animals. They may also use old holes as night time roosts.\n\nGreat spotted woodpeckers are monogamous in a breeding season, but may have different partners in different seasons.\n\nBreeding starts in mid-April. 3-8 eggs are laid, and there’s generally just one clutch in a breeding season. Both parents incubate and feed the young. Incubation takes around 2 weeks, and fledging occurs about 3 weeks after hatching. After fledging, the adults continue to feed the young for another 10 or so days.\n\nIt’s estimated that there are around 140,000 breeding pairs, mostly in England and Wales.",
    images: [
      'assets/woodpecker.png',
    ],
    birdFamily: 'Woodpeckers',
    conservationStatus: 'Green',
    scientificName: 'Dendrocopos major',
    birdType: BirdType.predator,
    id: 19,
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
