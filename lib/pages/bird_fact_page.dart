import 'package:flutter/material.dart';
import 'package:redland_green_bird_survey/model/main_model.dart';

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
    for (int i = 0; i < widget.bird.image.length; i++) {
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
                    widget.bird.image[i],
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
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            widget.bird.image[imageNumber],
                          ),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.bird.name,
                            style: Theme.of(context).textTheme.headline1),
                      ),
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
