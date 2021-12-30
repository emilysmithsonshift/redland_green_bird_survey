import 'package:flutter/material.dart';

import '../../../settings.dart';

class RGListTile extends StatelessWidget {
  final String? imageAsset;
  final Widget? widget;
  final bool? imageLeft;
  final Widget? navigateTo;
  final String? heroTag;
  final Alignment? alignment;

  const RGListTile(
      {Key? key,
      this.imageAsset,
      this.widget,
      this.imageLeft,
      this.navigateTo,
      this.heroTag,
      this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigateTo!),
        );
      },
      child: Container(
        decoration: defaultBoxDecoration(),
        margin: const EdgeInsets.all(8.0),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          height: 200,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(5.0, 5.0),
                blurRadius: 5.0,
              )
            ],
          ),
          child: Row(
            children: [
              if (imageLeft!)
                Flexible(
                  child: Hero(
                    tag: heroTag ?? '',
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: alignment ?? Alignment.center,
                          image: AssetImage(
                            imageAsset!,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              Flexible(
                flex: 2,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(imageLeft! ? 20.0 : 0),
                      bottomRight: Radius.circular(imageLeft! ? 20.0 : 0),
                      topLeft: Radius.circular(imageLeft! ? 0.0 : 20),
                      bottomLeft: Radius.circular(imageLeft! ? 0.0 : 20),
                    ),
                    child: Container(
                        height: double.infinity,
                        color: Colors.green[50],
                        child: widget)),
              ),
              if (!imageLeft!)
                Flexible(
                  child: Hero(
                    tag: heroTag ?? '',
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: alignment ?? Alignment.center,
                          image: AssetImage(
                            imageAsset!,
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
