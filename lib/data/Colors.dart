import 'package:flutter/material.dart';

const Map<String, Color> colorMap = {
  "red": Colors.red,
  "green": Colors.green,
  "yellow": Colors.yellow,
  "orange": Colors.orange,
  "grey": Colors.grey,
  "purple": Colors.purple,
  "blue": Colors.blue,
};

Color getColorFromName(String name) {
  return colorMap[name] ?? Colors.grey; // Default to grey if not found
}

String getNameFromColor(Color color) {
  return colorMap.entries
      .firstWhere((entry) => entry.value == color,
          orElse: () => const MapEntry("grey", Colors.grey))
      .key;
}
