import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.decoration,
    this.overflow,
  });

  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextDecoration? decoration;
  final TextOverflow? overflow;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
        decoration: decoration,
        height: 1.5,
        letterSpacing: 0.5,
        overflow: overflow,
      ),
    );
  }
}
