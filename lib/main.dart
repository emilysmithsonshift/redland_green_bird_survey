import 'package:flutter/material.dart';

import 'widgets/rg_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Redland Green Bird Survey',
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// turn can be placed in a [Scaffold.body].
  @override
  Widget build(BuildContext context) {
    final List<Widget> _gridList = [
      rGCard('Identify birds on the green', 'assets/bluetit.png'),
      rGCard(
          'Find out what you can do to help wildlife', 'assets/goldfinch.png'),
    ];

    final List<Widget> _widgetList = [
      rGCard('Enter your own observations ', 'assets/greattit.png'),
      rGCard('View the latest observations ', 'assets/robin.png'),
    ];
    final Widget observation = Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipOval(
              child: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset('assets/bluetit.png', fit: BoxFit.fill),
              ),
            ),
            SizedBox(width: 8),
            Column(
              children: [
                Text(
                  'Blue Tit',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('26th February 8pm'),
              ],
            ),
            Card(
                child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text('Box Number: 8'),
            ))
          ],
        ));
    return Scaffold(
      bottomNavigationBar: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
          color: Colors.white70,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Latest',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text('My Obs',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      )),
                ],
              ),
            ),
            Expanded(
              child: ListView(children: [
                observation,
                observation,
                observation,
              ]),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.green[100],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.green[100],
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: Text('Redland Green Bird Survey',
                      style: TextStyle(color: Colors.white70)),
                ),
              ),
              background: Image.asset('assets/robin.png', fit: BoxFit.fill),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return _gridList[index];
            }, childCount: _gridList.length),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _widgetList[index];
              },
              childCount: _widgetList.length,
            ),
          ),
        ],
      ),
    );
  }
}
