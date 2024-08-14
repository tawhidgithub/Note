import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../data/Colors.dart';

class GenerateColor {
  late int random;

  late Color colors;

  Color getColors() {
    random = Random().nextInt(colorMap.length);
    colors = colorMap.values.elementAt(random);

    return colors;
  }
}
