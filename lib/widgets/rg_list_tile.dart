import 'package:flutter/material.dart';

class RGListTile extends StatelessWidget {
  final String imageAsset;
  final Widget widget;
  final bool imageLeft;
  final Widget navigateTo;
  final String heroTag;
  final Alignment alignment;

  const RGListTile(
      {Key key,
      this.imageAsset,
      this.widget,
      this.imageLeft,
      this.navigateTo,
      this.heroTag,
      this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(color: Colors.green[100],
      child: GestureDetector(
        onTap: () {
          if (navigateTo != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => navigateTo,
              ),
            );
          }
        },
        child: Container(
          height: 200,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            boxShadow: [
              new BoxShadow(
                color: Colors.grey,
                offset: new Offset(5.0, 5.0),
                blurRadius: 5.0,
              )
            ],
          ),
          child: Row(
            children: [
              if (imageLeft)
                Flexible(
                  flex: 1,
                  child: Hero(
                    tag: heroTag ?? '',
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          alignment: alignment ?? Alignment.center,
                          image: AssetImage(
                            imageAsset,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              Flexible(
                flex: 2,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(imageLeft ? 20.0 : 0),
                        bottomRight: Radius.circular(imageLeft ? 20.0 : 0),
                        topLeft: Radius.circular(imageLeft ? 0.0 : 20),
                        bottomLeft: Radius.circular(imageLeft ? 0.0 : 20),
                      ),
                    ),
                    child: widget),
              ),
              if (!imageLeft)
                Flexible(
                  flex: 1,
                  child: Hero(
                    tag: heroTag ?? '',
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(
                            imageAsset,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
