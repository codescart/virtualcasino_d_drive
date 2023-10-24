// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// class Casino extends StatefulWidget {
//   @override
//   _CasinoState createState() => _CasinoState();
// }
//
// class _CasinoState extends State<Casino> with SingleTickerProviderStateMixin{
//   late final AnimationController _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 50000))..repeat();
//
//   int selected = 0;
//   int selected2 = 0;
//   final items = <String>[
//     '0',
//     '32',
//     '15',
//     '19',
//     '4',
//     '21',
//     '2',
//     '25',
//     '17',
//     '34',
//     '6',
//     '27',
//     '13',
//     '36',
//     '11',
//     '30',
//     '8',
//     '23',
//     '10',
//     '5',
//     '24',
//     '16',
//     '33',
//     '1',
//     '20',
//     '14',
//     '31',
//     '9',
//     '22',
//     '18',
//     '29',
//     '7',
//     '28',
//     '12',
//     '35',
//     '3',
//     '26',
//
//   ];
//
//
//   @override
//   void initState() {
//
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//       child: AnimatedBuilder(
//         animation: _controller,
//         builder: (_, child) {
//           return Transform.rotate(
//             angle: _controller.value * 2 * math.pi,
//             child: Stack(
//
//               children: [
//                 Positioned(child: Center(
//                   child: Container(
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage("assets/roulette/framecasino.png")
//                         )),
//                     height: 210,
//                     child: Padding(
//                       padding: const EdgeInsets.all(22.0),
//                       child: FortuneWheel(
//                         animateFirst: false,
//                         selected: selected,
//                         physics: CircularPanPhysics(
//                           duration: Duration(seconds: 3),
//                           curve: Curves.decelerate,
//                         ),
//
//
//                         indicators: const <FortuneIndicator>[
//                           FortuneIndicator(
//
//                               alignment: Alignment
//                                   .topCenter, // <-- changing the position of the indicator
//                               child: Text('')
//                           ),
//                         ],
//
//                         items: [
//                           for (var it in items) FortuneItem(
//                               style: FortuneItemStyle(
//                                 color:
//                                 it=='0'? Colors.green :
//                                 it=='32'? Colors.red:
//                                 it=='19'? Colors.red:
//                                 it=='21'? Colors.red:
//                                 it=='27'? Colors.red:
//                                 it=='25'? Colors.red:
//                                 it=='34'? Colors.red:
//                                 it=='36'? Colors.red:
//                                 it=='30'? Colors.red:
//                                 it=='23'? Colors.red:
//                                 it=='5'? Colors.red:
//                                 it=='16'? Colors.red:
//                                 it=='1'? Colors.red:
//                                 it=='14'? Colors.red:
//                                 it=='9'? Colors.red:
//                                 it=='18'? Colors.red:
//                                 it=='7'? Colors.red:
//                                 it=='12'? Colors.red:
//                                 it=='3'? Colors.red:
//
//                                 Colors.black, // <-- custom circle slice fill color
//                                 borderColor: Color(0xFFFFC501), // <-- custom circle slice stroke color
//                                 borderWidth: 1, // <-- custom circle slice stroke width
//                               ),
//                               child:
//                               Padding(
//                                 padding:  EdgeInsets.only(left: 65.0),
//                                 child: RotatedBox(
//                                     quarterTurns: 1,
//                                     child: Text(it, style: TextStyle(fontSize: 8, fontWeight:FontWeight.w700,color: Color(
//                                         0xffffffff)),)),
//                               )),
//                         ],
//                         onAnimationEnd: () {
//                           print("Value : " + "$selected");
//                         },
//                       ),
//                     ),
//                   ),
//                 )),
//                 Positioned(child: Center(
//                   child: Container(
//                     height: 120,
//                     child: FortuneWheel(
//                       rotationCount:3,
//                       animateFirst: false,
//                       selected: selected2,
//                       duration:Duration(seconds: 20),
//
//                       physics: CircularPanPhysics(
//                         duration: Duration(seconds: 1),
//                         curve: Curves.decelerate,
//                       ),
//
//                       styleStrategy: UniformStyleStrategy(
//                         textAlign:TextAlign.end,
//                         borderColor: Color(0xFFFFC501),
//                         color: Color(0xFF640000),
//                         borderWidth: 0.5,
//                       ),
//                       indicators: const <FortuneIndicator>[
//                         FortuneIndicator(
//
//                             alignment: Alignment
//                                 .topCenter, // <-- changing the position of the indicator
//                             child: Text('')
//                         ),
//                       ],
//
//                       items: [
//                         for (var it in items) FortuneItem(child:
//                         Padding(
//                             padding:  EdgeInsets.only(left: 40.0),
//                             child: RotatedBox(
//                               quarterTurns: 1,
//                               child: it=='1'?Image.asset('assets/roulette/ball.png',color: Colors.white, height: 8,width: 8,):Text(''),
//                             ))),
//                       ],
//                       onAnimationEnd: () {
//                         print("Value : " + "$selected2");
//                       },
//                     ),
//                   ),
//                 )),
//
//
//
//                 Center(
//                   child: CircleAvatar(
//                     radius: 45,
//                     backgroundColor: Color(0xffe12c76),
//                     child: Center(child: Image.network('https://nk.codescarts.com/casinostyle/image/fotor_2023-3-2_15_25_15.png'),
//
//                     ),
//                   ),
//                 ),
//
//               ],
//             ),
//           );
//         },
//
//       ),
//     );
//   }
// }
//
//
// final number = <int>[
//   0,
//   1,
//   2,
//   3,
//   4,
//   5,
//   6,
//   7,
//   8,
//   9,
//   10,
//   11,
//   12,
//   13,
//   14,
//   15,
//   16,
//   17,
//   18,
//   19,
//   20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36
// ];