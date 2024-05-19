import 'package:flutter/material.dart';

class BtnB extends StatelessWidget {
  const BtnB(
      {super.key,
      required this.onTap,
      this.color = const Color(0xffFF0000),
      required this.text});
  final VoidCallback onTap;
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Ink(
            child: Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        )));
  }
}
