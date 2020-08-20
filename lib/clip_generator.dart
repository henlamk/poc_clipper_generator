import 'dart:math';

import 'package:flutter/material.dart';

const int maxNumberOfClipPaths = 10;

class ClipGenerator {
  List<ClipPath> generateRandom(double height, double width) {
    int numberOfClipPaths = Random().nextInt(maxNumberOfClipPaths);

    print('generating $numberOfClipPaths clippaths');

    List<ClipPath> result = List<ClipPath>();

    for (int i = 0; i < numberOfClipPaths; i++) {
      result.add(ClipPath(
        clipper: CustomClipPath(),
        child: Container(
          height: height,
          width: width,
          color: Colors.blue,
        ),
      ));
    }
    return result;
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    int amountKnicks = Random().nextInt(10);
    List<Point> points = List<Point>();

    //one way
    for (int i = 0; i < amountKnicks; i++) {
      var point = getNextPoint(size);
      path.lineTo(point.x, point.y);
      points.add(point);
    }

    //return ticket
    for (Point point in points.reversed) {
      path.lineTo(point.x - 2, point.y - 2);
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }

  Point getNextPoint(Size size) {
    double startX = Random().nextInt((size.width).round()).toDouble();
    double startY = Random().nextInt((size.height).round()).toDouble();

    return Point(startX, startY);
  }
}
