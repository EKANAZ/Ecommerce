import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  TextOverflow overflow;

  SmallText(
      {super.key,
      this.color = const Color(0xFFccc7c5),
      required this.text,
      this.size = 12,
        this.overflow = TextOverflow.ellipsis,
      this.height = 1.2});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
          overflow: overflow,
      style: TextStyle(
          color: color, fontFamily: "Roboto", fontSize: size, height: height),
    );
  }
}
