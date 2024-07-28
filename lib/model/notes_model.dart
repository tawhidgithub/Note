import 'package:flutter/material.dart';
import 'package:sqldatabase/data/Colors.dart';

class NotesModle {
  final String title;
  final int? id;
  final dynamic description;
  final Color color;
  static const Color defaultColor = Colors.grey;
  NotesModle(
      {this.id,
      required this.title,
      required this.description,
      this.color = defaultColor});

  NotesModle.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["title"],
        description = res["discription"],
        color = getColorFromName(res["color"]);

  Map<String, Object?> toMap() {
    return {
      "id": id,
      "title": title,
      "discription": description,
      "color": getNameFromColor(color),
    };
  }
}
