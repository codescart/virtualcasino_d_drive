import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
// import 'package:flutter_flip_card/flipcard/flip_card.dart';
// import 'package:flutter_flip_card/modal/flip_side.dart';


class Flips extends StatefulWidget {

  @override
  State<Flips> createState() => _FlipsState();
}

class _FlipsState extends State<Flips> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();


  late FlipCardController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FlipCardController();
  }
  @override
  Widget build(BuildContext context) {

    final con = FlipCardController();

    // @override
    // void initState() {
    //   setState(() {
    //     con.flipcard();
    //
    //   });
    //
    //   // TODO: implement initState
    //   super.initState();
    // }

    return
      FlipCard(
        fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
        direction: FlipDirection.HORIZONTAL, // default
        side: CardSide.FRONT, // The side to initially display.
       controller: con,
        front: Container(
          child: Text('Front'),
        ),
        back: Container(
          child: Text('Back'),
        ),
        autoFlipDuration: const Duration(seconds: 1), // The flip effect will work automatically after the 2 seconds
      );


    //   FlipCard(
    //     rotateSide: RotateSide.bottom,
    //     onTapFlipping: false, //When enabled, the card will flip automatically when touched.
    //     axis: FlipAxis.horizontal,
    //     controller: con,
    //     frontWidget: Container(
    //       height: 60,
    //       width: 30,
    //       child: Image.asset(
    //         "assets/dragon/cardback.png",
    //       ),
    //     ),
    //     backWidget: Container(
    //         height: 60,
    //         width: 30,
    //         child: Image.asset(
    //         'assets/dragon/cardback.png',
    //         fit: BoxFit.fitHeight)
    //     )
    // );
  }
  
}
