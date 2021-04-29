import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/widgets/page_template.dart';

class FactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: 'Fact Page',
      image: 'assets/wren3.png',
      widgetList: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Do you know the answers to the questions below?',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'What is sexual dimorphism in a species?',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: Text(
                      'Dimorphism means that the two sexes of the same species differ in appearance from each other. '
                      'This may be in size, weight, colour and markings. It may also include behavioural differences.'
                      'A blackbird (pictured right) is a class case where the female is actually brown. ',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      child: Image.asset('assets/blackbird2.png'),
                    ),
                  )
                ],
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'What sorts of trees are likely to have holes and cavities that birds can nest in?',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Text(
                'Holes are found mainly in old trees. '
                'This is one of many reasons why old trees are so important to protect, '
                'as they provide habitat for a huge range of species in addition to birds. '
                'There are many reasons holes develop. Holes may develop as the result of '
                'injury caused by forces such as wind or lightening, or attacks by insects, bacteria or fungi. '
                'Holes can take a long time to form, and can vary in size, depth, shape, insulation and size '
                'of entrance hole, making them suitable for many different animals. ',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'What causes the chest and abdomen of some blue tits to be a brighter sulphur yellow than others?',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        child: Image.asset('assets/bluetit1.png'),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Text(
                      'Brightness varies according to how many yellow-green caterpillars are eaten, '
                      'as such caterpillars contain high levels of the carotene (red, orange, yellow) pigments.',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'The brighter the yellow chest of the great tit, the more attractive he is to female great tits. Why might this be??',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Text(
                'Brighter yellow chests are caused by the presence of carotenoids, which are red, '
                'orange and yellow pigments produced by some plants. Carotenoids cannot be made by the bird, '
                'and have to be obtained from food. A bright yellow chest signifies to the female that '
                'the male is healthy and well fed, and will therefore also be able to feed his young brood.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'If a great tit is raised in a nest of blue tits, what is its future?',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Text(
                'The great tit is likely to be successfully raised along with the rest of the brood, '
                'but it will be confused about its species. It won’t recover from this, and will not be able to breed.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'If a blue tit is raised in a nest of great tits, what is its future?',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: Text(
                      'Initially, the bird is likely to be confused about its species. '
                      'However, it will recover from this. It is likely to go on to breed.',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      child: Image.asset('assets/greattit_close.png'),
                    ),
                  )
                ],
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Will any of the nest boxes in Redland Green be used by coal tits?',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Text(
                'Coal tits nest in tree hollows or old mouse holes in the ground. '
                'They will nest in boxes, although they prefer boxes with a '
                'small hole to prevent larger birds from being able to evict them. '
                'While coal tits do live in this area, it is unlikely any of our boxes '
                'will be used by coal tits, as they prefer to nest in boxes hung on conifers '
                'rather than deciduous trees. Perhaps we should plant a few conifers?',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Why do robins feature so often on Christmas cards?',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      child: Image.asset('assets/robin_close.png'),
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    flex: 3,
                    child: Text(
                      'The tradition of sending postcards began in the Victorian era. '
                      'At that time, postmen wore red jackets, and so acquired the '
                      'nickname of “robins”, thus beginning this long association.',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'What about long-tailed tits? Will they use nest boxes?',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Text(
                'Long-tailed tits nest in trees or bushes, or even brambles, '
                'making ball-shaped nests out of moss, hair and feathers, '
                'and camouflaging them with lichen and spiders’ webs. '
                'The nests may take several weeks to build and can be lined '
                'with 1,500 or more feathers, to make them soft enough for their 8-12 eggs. '
                'Long-tailed tits are frequently seen or heard in the allotments next to '
                'Redland Green, but they are not very likely to use nest boxes to nest in. '
                'However, they will sometimes use nest boxes as communal roosting sites in winter.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'What birds will use nest boxes as winter roosts?',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: Text(
                      'Many birds that nest in cavities will use nest boxes as winter roosts. '
                      'In particular, very small birds will congregate together in boxes overnight, '
                      'seeking protection from the weather and predators, and sharing body heat. '
                      'Blue tits, coal tits, house sparrows and wrens are all known to use nesting '
                      'boxes to roost in over the winter months. In fact, the maximum number of wrens to '
                      'occupy a nest box as a roost, according to the British Trust for Ornithology, is 63 individuals!',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      child: Image.asset('assets/coaltit1.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'What does a sparrowhawk prey upon?',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Text(
                'There have been sparrowhawks living in the area for at least two decades. '
                'A pair can sometimes be seen around the green in August, luring their young away '
                'from their nest with prey items in their talons, encouraging their young to catch '
                'dropped prey mid-flight. Sparrowhawks prey upon other birds. They are ambush predators, '
                'adapted to woodland hunting. They usually watch for prey from a sheltered position such '
                'as a tree; if they miss their catch, they chase the bird through the trees, displaying '
                'great speed, precision and agility. The falcon (female) is up to 25% larger than the tercel '
                '(male) and can weigh almost twice as much. Falcons can kill birds up to pigeon size – '
                'similar to her own size. The tercel, larger than a blackbird but smaller than a collared dove, '
                'takes birds up to the size of a thrush. Both may also feed on small mammals. '
                'The sparrowhawk has rounded wings and a long, narrow tail. Tercels have a blue-grey '
                'back and wings; their chest and abdomen are white with orange-brown bars. The plumage of '
                'falcons is brown-grey on the upper parts, with brown-grey and white barring on the underside. '
                'Both sexes have barred tails, red cheeks and yellow legs and eyes. A pile of feathers on the '
                'ground is an indication that a sparrowhawk has plucked a kill – they do so on so-called '
                '“plucking posts” – a raised, flat structure on which they can remove inedible parts and '
                'take the prey apart for eating.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Are there any kestrels in Redland?',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Text(
                'There aren’t any known sightings of kestrels in Redland, although kestrels '
                'have adapted to live in cities. The kestrel, a member of the falcon family, '
                'and with the long, scythe-like wings of that family, hunts by hovering 10-20 '
                'metres over grassland, spotting prey with its extremely sharp eyesight and '
                'plummeting to the ground in pursuit of a kill. Females are larger than males, '
                'and both are slightly smaller than sparrowhawks. Kestrels’ main prey are small '
                'mammals such as voles, shrews and mice, although they may also take small birds, '
                'lizards and invertebrates. When hovering, the kestrel’s tail is spread into a fan shape. '
                'Sparrowhawks do not hover, being ambush predators of mainly birds, so hunting technique '
                'is one of the ways of telling these two species apart. Kestrel populations have fallen, '
                'and they are now on the amber list of conservation concern. This may because modern farming '
                'practices have eliminated wide field margins, therefore also eliminating the habitat of the '
                'kestrel’s main prey items. The UK population of kestrels may be as low as 30,000 pairs. ',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ],
      heroTag: 'fact_page',
    );
  }
}
