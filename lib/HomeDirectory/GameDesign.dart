import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class GameDesign extends StatefulWidget {
  final String gamename;
  final String gamegif;

  GameDesign({Key? key, required this.gamename, required this.gamegif}) : super(key: key);

  @override
  State<GameDesign> createState() => _GameDesignState();
}

class _GameDesignState extends State<GameDesign> {
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width =MediaQuery.of(context).size.width;
    return Container(
        height: height,
        width: width,
        child: Container(
            height: height*0.98,
            width: width*0.2,
            child: Image.asset(widget.gamegif)),

    );
  }
}
