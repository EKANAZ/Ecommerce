import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  Color? color;
  final String text;

  double size;

  TextOverflow overflow;

  BigText(
      {super.key,
      this.color = const Color.fromARGB(255, 225, 220, 220),
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        letterSpacing: 1,
        color: color,
        fontFamily: "Roboto",
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }
}
