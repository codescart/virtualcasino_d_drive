import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class marquee extends StatefulWidget {
  const marquee({super.key});
  @override
  State<marquee> createState() => _DragonTheamState();
}

class _DragonTheamState extends State<marquee> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Marquee(
          text: 'Some sample text that takes some space.',
          style: TextStyle(fontWeight: FontWeight.bold),
          scrollAxis: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          blankSpace: 20.0,
          velocity: 100.0,
          pauseAfterRound: Duration(seconds: 1),
          startPadding: 10.0,
          accelerationDuration: Duration(seconds: 1),
          accelerationCurve: Curves.linear,
          decelerationDuration: Duration(milliseconds: 500),
          decelerationCurve: Curves.easeOut,
        ),

      ],


    );
  }
}
