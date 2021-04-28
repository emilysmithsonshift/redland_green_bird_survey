import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final String title;
  final String image;
  final List<Widget> widgetList;
  final List<Widget> gridList;
  final String heroTag;
  final int crossAxisCount;

  const PageTemplate(
      {Key key,
      this.title,
      this.image,
      this.widgetList,
      this.gridList,
      this.heroTag,
      this.crossAxisCount})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.green[100],
            // pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.all(0),
              title: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              background: Hero(
                tag: heroTag,
                child: Image.asset(
                  image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return widgetList[index];
              },
              childCount: widgetList.length,
            ),
          ),
          if (gridList != null)
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount ?? 2,
              ),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return gridList[index];
              }, childCount: gridList.length),
            ),
        ],
      ),
    );
  }
}
