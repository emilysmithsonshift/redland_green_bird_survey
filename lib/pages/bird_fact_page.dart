import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/models/birds.dart';

import '../settings.dart';

class BirdFactPage extends StatefulWidget {
  final Bird bird;
  final String heroKey;

  const BirdFactPage({Key key, this.bird, this.heroKey}) : super(key: key);

  @override
  _BirdFactPageState createState() => _BirdFactPageState();
}

class _BirdFactPageState extends State<BirdFactPage> {
  int imageNumber = 0;
  List<Widget> photoList = [];

  @override
  void initState() {
    for (int i = 0; i < widget.bird.images.length; i++) {
      photoList.add(
        GestureDetector(
          onTap: () {
            setState(() {
              imageNumber = i;
            });
          },
          child: Container(
              margin: const EdgeInsets.all(2),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    widget.bird.images[i],
                  ),
                ),
              )),
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width,
                  child: Hero(
                    tag: widget.heroKey ?? '${widget.bird.name}1',
                    child: Material(
                      color: Colors.green[100],
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              widget.bird.images[imageNumber],
                            ),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              width: double.infinity,
                              height: 60,
                              color: Colors.white30,
                              child: Center(
                                child: Text(widget.bird.name,
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    )),
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                        child: Wrap(children: photoList),
                      ),
                      const SizedBox(height: 8),
                      Container(
                          margin: const EdgeInsets.all(16.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration:
                              defaultBoxDecoration(color: Colors.green[50]),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(children: [
                                  Text('Conservation status: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2),
                                  Text(
                                    widget.bird.conservationStatus ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .copyWith(
                                          color: widget.bird
                                                      .conservationStatus ==
                                                  'Green'
                                              ? Colors.green
                                              : widget.bird
                                                          .conservationStatus ==
                                                      'Amber'
                                                  ? Colors.amber
                                                  : Colors.red,
                                        ),
                                  )
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(children: [
                                  Text('Scientific Name: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2),
                                  Text(widget.bird.scientificName ?? '')
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(children: [
                                  Text('Bird Family: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2),
                                  Text(widget.bird.birdFamily ?? '')
                                ]),
                              ),
                            ],
                          )),
                      Text(widget.bird.description),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
