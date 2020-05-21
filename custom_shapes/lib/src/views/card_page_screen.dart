import 'dart:math';

import 'package:custom_shapes/src/shape_screen.dart';
import 'package:flutter/material.dart';

const pages = 8;
const cardAspectRatio = 12.0 / 16.0;
const widgetAspectRatio = cardAspectRatio * 1.2;
var colors = List.from(Colors.accents)..shuffle();

class CardPageScreen extends StatefulWidget {
  const CardPageScreen({
    Key key,
  }) : super(key: key);

  @override
  _CardPageScreenState createState() => _CardPageScreenState();
}

class _CardPageScreenState extends State<CardPageScreen> {
  var currentPage = pages - 1.0;
  PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: pages - 1);
    controller.addListener(() => setState(() => currentPage = controller.page));
  }

  @override
  Widget build(BuildContext context) {
    return ShapeScreen(
      body: Stack(
        children: <Widget>[
          CardScrollWidget(currentPage),
          Positioned.fill(
            child: PageView.builder(
              itemCount: pages,
              controller: controller,
              reverse: true,
              itemBuilder: (context, index) => Container(),
            ),
          )
        ],
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, constraints) {
        var width = constraints.maxWidth;
        var height = constraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        return Stack(
          children: List.generate(pages, (i) {
            var delta = i - currentPage;
            bool isOnRight = delta > 0;

            var start = padding + max(primaryCardLeft - horizontalInset * -delta * (isOnRight ? 15 : 1), 0.0);

            return i > currentPage - 3
                ? Positioned.directional(
                    top: padding + verticalInset * max(-delta, i * 0.1),
                    bottom: padding + verticalInset * max(-delta, 0.0),
                    start: start,
                    textDirection: TextDirection.rtl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.primaries[i],
                          boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(3.0, 6.0), blurRadius: 10.0)],
                        ),
                        child: AspectRatio(
                          aspectRatio: cardAspectRatio,
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                      child: Text(
                                        'Book of the Kings (Volume $i)',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          fontFamily: "SF-Pro-Text-Regular",
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.0),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
                                        decoration: BoxDecoration(color: colors[i], borderRadius: BorderRadius.circular(20.0)),
                                        child: Text("Read Later", style: TextStyle(color: Colors.white)),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Container();
          }).toList(),
        );
      }),
    );
  }
}
