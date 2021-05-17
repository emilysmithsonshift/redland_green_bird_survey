import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final String title;
  final String image;
  final List<Widget> widgetList;
  final List<Widget> gridList;
  final String heroTag;
  final double size;
  final List<Widget> listTileList;

  const PageTemplate(
      {Key key,
      this.title,
      this.image,
      this.widgetList,
      this.gridList,
      this.heroTag,
      this.size,
      this.listTileList})
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
            expandedHeight: MediaQuery.of(context).size.height * 0.25,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.all(0),
              title: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: double.infinity,
                ),
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              background: Hero(
                tag: heroTag,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          if (widgetList != null)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return widgetList[index];
                },
                childCount: widgetList.length,
              ),
            ), // Re-implementing the above SliverGrid.count example:
          if (listTileList != null)
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 600,
                childAspectRatio: 1.8,
              ),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return listTileList[index];
              }, childCount: listTileList.length),
            ),
          if (gridList != null)
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 1,
                maxCrossAxisExtent: size ?? 300,
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
