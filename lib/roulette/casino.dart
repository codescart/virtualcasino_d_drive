import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class ClockModel {

  late int hour;
  late int minute;
  late int second;
  late bool is24HourFormat;

  get is24HourTimeFormat => this.is24HourFormat;
}
class Casino extends StatefulWidget {
  @override
  _CasinoState createState() => _CasinoState();
}

class _CasinoState extends State<Casino> with SingleTickerProviderStateMixin{
  late DateTime _dateTime;
  late ClockModel _clockModel;
  late Timer _timer;
  int tom=0;
  late final AnimationController _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 50000))..repeat();

  int selected = 0;
  int selected2 = 0;
  final items = <String>[
    '0',
    '32',
    '15',
    '19',
    '4',
    '21',
    '2',
    '25',
    '17',
    '34',
    '6',
    '27',
    '13',
    '36',
    '11',
    '30',
    '8',
    '23',
    '10',
    '5',
    '24',
    '16',
    '33',
    '1',
    '20',
    '14',
    '31',
    '9',
    '22',
    '18',
    '29',
    '7',
    '28',
    '12',
    '35',
    '3',
    '26',
  ];


  @override
  void initState() {
    sound();
    // TODO: implement initState
    super.initState();
    _dateTime = DateTime.now();
    _clockModel = ClockModel();
    _clockModel.is24HourFormat =  true;

    _dateTime = DateTime.now();
    _clockModel.hour = _dateTime.hour;
    _clockModel.minute = _dateTime.minute;
    _clockModel.second = _dateTime.second;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _dateTime = DateTime.now();
      _clockModel.hour = _dateTime.hour;
      _clockModel.minute = _dateTime.minute;
      _clockModel.second = _dateTime.second;
      // print(_clockModel.second);
      setState(() {
        tom=_clockModel.second;
      });
      timest();

    });
  }
  var pop=false;
  timest(){
    // var times =tom.toString();
    print(tom.toString());
    var watch=tom;

    if(watch ==59 ){
      // Navigator.pop(context);
      print("object");

    }
    if(watch==50){
      tripleapi();
      setState(() {
        pop=true;
      });
      // popstop();

    }else {
      setState(() {
        pop = false;
      });
    }


    print(watch);
    print(pop);
  }
  tripleapi() async {
    final res= await http.get(Uri.parse('https://casino.foundercodes.com/demo/betserial/roulett_res.php'));
    final data = jsonDecode(res.body);

    var myInt1 = data['index'];

print(myInt1);
    setState(() {
      selected=myInt1;
          selected2=myInt1+4;
    });



  }

  // popstop(){
  //   print(pop);
  //   WidgetsBinding.instance?.addPostFrameCallback((_) {
  //     pop==true
  //         ?   showDialog(
  //         context: context!,
  //         barrierDismissible: false,
  //         builder: (ctx) =>
  //             AlertDialog(
  //               backgroundColor: Colors.transparent,
  //               content: Container(
  //                 width: 250,
  //                 height: 300,
  //                 child: AnimatedBuilder(
  //                   animation: _controller,
  //                   builder: (_, child) {
  //                     return Transform.rotate(
  //                       angle: _controller.value * 2 * math.pi,
  //                       child: Stack(
  //                         clipBehavior: Clip.none,
  //                         children: [
  //                           Positioned(child: Center(
  //                             child: Container(
  //                               decoration: BoxDecoration(
  //                                   image: DecorationImage(
  //                                       image: AssetImage("assets/home/framefun.png"),
  //                                       fit: BoxFit.fill
  //                                   )),
  //                               height: 170,
  //                               width: 170,
  //                               child: Padding(
  //                                 padding: const EdgeInsets.all(15.0),
  //                                 child: FortuneWheel(
  //                                   animateFirst: false,
  //                                   selected: selected,
  //                                   physics: CircularPanPhysics(
  //                                     duration: Duration(seconds: 3),
  //                                     curve: Curves.decelerate,
  //                                   ),
  //                                   indicators: const <FortuneIndicator>[
  //                                     FortuneIndicator(
  //                                         alignment: Alignment
  //                                             .topCenter, // <-- changing the position of the indicator
  //                                         child: Text('')
  //                                     ),
  //                                   ],
  //
  //                                   items: [
  //                                     for (var it in items) FortuneItem(
  //                                       style: FortuneItemStyle(
  //                                         color:
  //                                         it=='0'? Colors.green :
  //                                         it=='32'? Colors.red:
  //                                         it=='19'? Colors.red:
  //                                         it=='21'? Colors.red:
  //                                         it=='27'? Colors.red:
  //                                         it=='25'? Colors.red:
  //                                         it=='34'? Colors.red:
  //                                         it=='36'? Colors.red:
  //                                         it=='30'? Colors.red:
  //                                         it=='23'? Colors.red:
  //                                         it=='5'? Colors.red:
  //                                         it=='16'? Colors.red:
  //                                         it=='1'? Colors.red:
  //                                         it=='14'? Colors.red:
  //                                         it=='9'? Colors.red:
  //                                         it=='18'? Colors.red:
  //                                         it=='7'? Colors.red:
  //                                         it=='12'? Colors.red:
  //                                         it=='3'? Colors.red:
  //                                         Colors.black,
  //                                         borderColor: Color(0xFFFFC501), // <-- custom circle slice stroke color
  //                                         borderWidth: 1, // <-- custom circle slice stroke width
  //                                       ),
  //                                       child:
  //                                       Padding(
  //                                         padding:  EdgeInsets.only(left: 55.0),
  //                                         child: RotatedBox(
  //                                             quarterTurns: 1,
  //                                             child: Text(
  //                                               it, style: TextStyle(
  //                                                 fontSize: 8, fontWeight:FontWeight.w700,color: Color(
  //                                                 0xffffffff
  //                                             )
  //                                             ),
  //                                             )
  //                                         ),
  //                                       ),
  //                                     ),
  //                                   ],
  //                                   onAnimationEnd: () {
  //                                     print("Value : " + "$selected");
  //                                   },
  //                                 ),
  //                               ),
  //                             ),
  //                           )),
  //                           Positioned(
  //                               child: Center(
  //                                 child: Container(
  //                                   height: 110,
  //                                   child: FortuneWheel(
  //                                     rotationCount:3,
  //                                     animateFirst: false,
  //                                     selected: selected2,
  //                                     duration:Duration(seconds: 20),
  //                                     physics: CircularPanPhysics(
  //                                       duration: Duration(seconds: 1),
  //                                       curve: Curves.decelerate,
  //                                     ),
  //
  //                                     styleStrategy: UniformStyleStrategy(
  //                                       textAlign:TextAlign.end,
  //                                       borderColor: Color(0xFFFFC501),
  //                                       color: Color(0xFF640000),
  //                                       borderWidth: 0.5,
  //                                     ),
  //                                     indicators: const <FortuneIndicator>[
  //                                       FortuneIndicator(
  //                                           alignment: Alignment
  //                                               .topCenter, // <-- changing the position of the indicator
  //                                           child: Text('')
  //                                       ),
  //                                     ],
  //                                     items: [
  //                                       for (var it in items)
  //                                         FortuneItem(
  //                                             child:Padding(
  //                                                 padding:  EdgeInsets.only(left: 40),
  //                                                 child: RotatedBox(
  //                                                   quarterTurns: 1,
  //                                                   child: it=='1'?Image.asset('assets/roulette/ball.png',color: Colors.white, height: 5,width: 5,):Text(''),
  //                                                 )
  //                                             )
  //                                         ),
  //                                     ],
  //                                     onAnimationEnd: () {
  //                                       print("Value : " + "$selected2");
  //                                     },
  //                                   ),
  //                                 ),
  //                               )),
  //                           Center(
  //                             child: CircleAvatar(
  //                               radius: 45,
  //                               backgroundColor: Color(0xffe12c76),
  //                               child: Center(child: Image.asset('assets/roulette/centerm.png'),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     );
  //                   },
  //
  //                 ),
  //               ),
  //             )
  //     ):"";
  //   });
  // }
  final AudioCache _player = AudioCache();
  sound()async{
    final prefs = await SharedPreferences.getInstance();
    final soundsl= await prefs.getBool('sounds')??false;
    soundsl ==false?print('ok'):
    await _player.play('audio/click_sound.mp3');
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        sound();
        setState(() {
          selected2=4;
        });
        // showDialog(
        //     context: context!,
        //     builder: (ctx) =>
        //         AlertDialog(
        //           backgroundColor: Colors.transparent,
        //           content: Container(
        //             width: 250,
        //             height: 300,
        //             child: AnimatedBuilder(
        //               animation: _controller,
        //               builder: (_, child) {
        //                 return Transform.rotate(
        //                   angle: _controller.value * 2 * math.pi,
        //                   child: Stack(
        //                     clipBehavior: Clip.none,
        //                     children: [
        //                       Positioned(child: Center(
        //                         child: Container(
        //                           decoration: BoxDecoration(
        //                               image: DecorationImage(
        //                                   image: AssetImage("assets/roulette/framecasino.png"),
        //                                   fit: BoxFit.fill
        //                               )),
        //                           height: 170,
        //                           width: 170,
        //                           child: Padding(
        //                             padding: const EdgeInsets.all(15.0),
        //                             child: FortuneWheel(
        //                               animateFirst: false,
        //                               selected: selected,
        //                               physics: CircularPanPhysics(
        //                                 duration: Duration(seconds: 3),
        //                                 curve: Curves.decelerate,
        //                               ),
        //                               indicators: const <FortuneIndicator>[
        //                                 FortuneIndicator(
        //                                     alignment: Alignment
        //                                         .topCenter, // <-- changing the position of the indicator
        //                                     child: Text('')
        //                                 ),
        //                               ],
        //
        //                               items: [
        //                                 for (var it in items) FortuneItem(
        //                                     style: FortuneItemStyle(
        //                                       color:
        //                                       it=='0'? Colors.green :
        //                                       it=='32'? Colors.red:
        //                                       it=='19'? Colors.red:
        //                                       it=='21'? Colors.red:
        //                                       it=='27'? Colors.red:
        //                                       it=='25'? Colors.red:
        //                                       it=='34'? Colors.red:
        //                                       it=='36'? Colors.red:
        //                                       it=='30'? Colors.red:
        //                                       it=='23'? Colors.red:
        //                                       it=='5'? Colors.red:
        //                                       it=='16'? Colors.red:
        //                                       it=='1'? Colors.red:
        //                                       it=='14'? Colors.red:
        //                                       it=='9'? Colors.red:
        //                                       it=='18'? Colors.red:
        //                                       it=='7'? Colors.red:
        //                                       it=='12'? Colors.red:
        //                                       it=='3'? Colors.red:
        //                                       Colors.black,
        //                                       borderColor: Color(0xFFFFC501), // <-- custom circle slice stroke color
        //                                       borderWidth: 1, // <-- custom circle slice stroke width
        //                                     ),
        //                                     child:
        //                                     Padding(
        //                                       padding:  EdgeInsets.only(left: 55.0),
        //                                       child: RotatedBox(
        //                                           quarterTurns: 1,
        //                                           child: Text(
        //                                             it, style: TextStyle(
        //                                               fontSize: 8, fontWeight:FontWeight.w700,color: Color(
        //                                               0xffffffff
        //                                           )
        //                                           ),
        //                                         )
        //                                       ),
        //                                     ),
        //                                 ),
        //                               ],
        //                               onAnimationEnd: () {
        //                                 print("Value : " + "$selected");
        //                               },
        //                             ),
        //                           ),
        //                         ),
        //                       )),
        //                       Positioned(
        //                         child: Center(
        //                         child: Container(
        //                           height: 110,
        //                           child: FortuneWheel(
        //                             rotationCount:3,
        //                             animateFirst: false,
        //                             selected: selected2,
        //                             duration:Duration(seconds: 20),
        //                             physics: CircularPanPhysics(
        //                               duration: Duration(seconds: 1),
        //                               curve: Curves.decelerate,
        //                             ),
        //
        //                             styleStrategy: UniformStyleStrategy(
        //                               textAlign:TextAlign.end,
        //                               borderColor: Color(0xFFFFC501),
        //                               color: Color(0xFF640000),
        //                               borderWidth: 0.5,
        //                             ),
        //                             indicators: const <FortuneIndicator>[
        //                               FortuneIndicator(
        //                                   alignment: Alignment
        //                                       .topCenter, // <-- changing the position of the indicator
        //                                   child: Text('')
        //                               ),
        //                             ],
        //                             items: [
        //                               for (var it in items)
        //                                 FortuneItem(
        //                                 child:Padding(
        //                                   padding:  EdgeInsets.only(left: 40),
        //                                   child: RotatedBox(
        //                                     quarterTurns: 1,
        //                                     child: it=='1'?Image.asset('assets/roulette/ball.png',color: Colors.white, height: 5,width: 5,):Text(''),
        //                                   )
        //                                 )
        //                                 ),
        //                             ],
        //                             onAnimationEnd: () {
        //                               print("Value : " + "$selected2");
        //                             },
        //                           ),
        //                         ),
        //                       )),
        //                       Center(
        //                         child: CircleAvatar(
        //                           radius: 45,
        //                           backgroundColor: Color(0xffe12c76),
        //                           child: Center(child: Image.asset('assets/roulette/centerm.png'),
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 );
        //               },
        //
        //             ),
        //           ),
        //         ));    // showDialog(
        //     context: context!,
        //     builder: (ctx) =>
        //         AlertDialog(
        //           backgroundColor: Colors.transparent,
        //           content: Container(
        //             width: 250,
        //             height: 300,
        //             child: AnimatedBuilder(
        //               animation: _controller,
        //               builder: (_, child) {
        //                 return Transform.rotate(
        //                   angle: _controller.value * 2 * math.pi,
        //                   child: Stack(
        //                     clipBehavior: Clip.none,
        //                     children: [
        //                       Positioned(child: Center(
        //                         child: Container(
        //                           decoration: BoxDecoration(
        //                               image: DecorationImage(
        //                                   image: AssetImage("assets/roulette/framecasino.png"),
        //                                   fit: BoxFit.fill
        //                               )),
        //                           height: 170,
        //                           width: 170,
        //                           child: Padding(
        //                             padding: const EdgeInsets.all(15.0),
        //                             child: FortuneWheel(
        //                               animateFirst: false,
        //                               selected: selected,
        //                               physics: CircularPanPhysics(
        //                                 duration: Duration(seconds: 3),
        //                                 curve: Curves.decelerate,
        //                               ),
        //                               indicators: const <FortuneIndicator>[
        //                                 FortuneIndicator(
        //                                     alignment: Alignment
        //                                         .topCenter, // <-- changing the position of the indicator
        //                                     child: Text('')
        //                                 ),
        //                               ],
        //
        //                               items: [
        //                                 for (var it in items) FortuneItem(
        //                                     style: FortuneItemStyle(
        //                                       color:
        //                                       it=='0'? Colors.green :
        //                                       it=='32'? Colors.red:
        //                                       it=='19'? Colors.red:
        //                                       it=='21'? Colors.red:
        //                                       it=='27'? Colors.red:
        //                                       it=='25'? Colors.red:
        //                                       it=='34'? Colors.red:
        //                                       it=='36'? Colors.red:
        //                                       it=='30'? Colors.red:
        //                                       it=='23'? Colors.red:
        //                                       it=='5'? Colors.red:
        //                                       it=='16'? Colors.red:
        //                                       it=='1'? Colors.red:
        //                                       it=='14'? Colors.red:
        //                                       it=='9'? Colors.red:
        //                                       it=='18'? Colors.red:
        //                                       it=='7'? Colors.red:
        //                                       it=='12'? Colors.red:
        //                                       it=='3'? Colors.red:
        //                                       Colors.black,
        //                                       borderColor: Color(0xFFFFC501), // <-- custom circle slice stroke color
        //                                       borderWidth: 1, // <-- custom circle slice stroke width
        //                                     ),
        //                                     child:
        //                                     Padding(
        //                                       padding:  EdgeInsets.only(left: 55.0),
        //                                       child: RotatedBox(
        //                                           quarterTurns: 1,
        //                                           child: Text(
        //                                             it, style: TextStyle(
        //                                               fontSize: 8, fontWeight:FontWeight.w700,color: Color(
        //                                               0xffffffff
        //                                           )
        //                                           ),
        //                                         )
        //                                       ),
        //                                     ),
        //                                 ),
        //                               ],
        //                               onAnimationEnd: () {
        //                                 print("Value : " + "$selected");
        //                               },
        //                             ),
        //                           ),
        //                         ),
        //                       )),
        //                       Positioned(
        //                         child: Center(
        //                         child: Container(
        //                           height: 110,
        //                           child: FortuneWheel(
        //                             rotationCount:3,
        //                             animateFirst: false,
        //                             selected: selected2,
        //                             duration:Duration(seconds: 20),
        //                             physics: CircularPanPhysics(
        //                               duration: Duration(seconds: 1),
        //                               curve: Curves.decelerate,
        //                             ),
        //
        //                             styleStrategy: UniformStyleStrategy(
        //                               textAlign:TextAlign.end,
        //                               borderColor: Color(0xFFFFC501),
        //                               color: Color(0xFF640000),
        //                               borderWidth: 0.5,
        //                             ),
        //                             indicators: const <FortuneIndicator>[
        //                               FortuneIndicator(
        //                                   alignment: Alignment
        //                                       .topCenter, // <-- changing the position of the indicator
        //                                   child: Text('')
        //                               ),
        //                             ],
        //                             items: [
        //                               for (var it in items)
        //                                 FortuneItem(
        //                                 child:Padding(
        //                                   padding:  EdgeInsets.only(left: 40),
        //                                   child: RotatedBox(
        //                                     quarterTurns: 1,
        //                                     child: it=='1'?Image.asset('assets/roulette/ball.png',color: Colors.white, height: 5,width: 5,):Text(''),
        //                                   )
        //                                 )
        //                                 ),
        //                             ],
        //                             onAnimationEnd: () {
        //                               print("Value : " + "$selected2");
        //                             },
        //                           ),
        //                         ),
        //                       )),
        //                       Center(
        //                         child: CircleAvatar(
        //                           radius: 45,
        //                           backgroundColor: Color(0xffe12c76),
        //                           child: Center(child: Image.asset('assets/roulette/centerm.png'),
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 );
        //               },
        //
        //             ),
        //           ),
        //         ));

      },
      child: Container(
        width: 250,
        height: 300,

        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * math.pi,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(child: Center(
                    child: Container(

                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/home/framefun.png"),
                            fit: BoxFit.fill

                          )),
                      height: 170,
                      width: 170,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: FortuneWheel(
                          animateFirst: false,
                          selected: selected,
                          physics: CircularPanPhysics(
                            duration: Duration(seconds: 3),
                            curve: Curves.decelerate,
                          ),


                          indicators: const <FortuneIndicator>[
                            FortuneIndicator(

                                alignment: Alignment
                                    .topCenter, // <-- changing the position of the indicator
                                child: Text('')
                            ),
                          ],

                          items: [
                            for (var it in items) FortuneItem(
                                style: FortuneItemStyle(
                                  color:
                                  it=='0'? Colors.green :
                                  it=='32'? Colors.red:
                                  it=='19'? Colors.red:
                                  it=='21'? Colors.red:
                                  it=='27'? Colors.red:
                                  it=='25'? Colors.red:
                                  it=='34'? Colors.red:
                                  it=='36'? Colors.red:
                                  it=='30'? Colors.red:
                                  it=='23'? Colors.red:
                                  it=='5'? Colors.red:
                                  it=='16'? Colors.red:
                                  it=='1'? Colors.red:
                                  it=='14'? Colors.red:
                                  it=='9'? Colors.red:
                                  it=='18'? Colors.red:
                                  it=='7'? Colors.red:
                                  it=='12'? Colors.red:
                                  it=='3'? Colors.red:

                                  Colors.black, // <-- custom circle slice fill color
                                  borderColor: Color(0xFFFFC501), // <-- custom circle slice stroke color
                                  borderWidth: 1, // <-- custom circle slice stroke width
                                ),
                                child:
                                Padding(
                                  padding:  EdgeInsets.only(left: 55.0),
                                  child: RotatedBox(
                                      quarterTurns: 1,
                                      child: Text(it, style: TextStyle(fontSize: 8, fontWeight:FontWeight.w700,color: Color(
                                          0xffffffff)),)),
                                )),
                          ],
                          onAnimationEnd: () {
                            print("Value : " + "$selected");
                          },
                        ),
                      ),
                    ),
                  )),
                  Positioned(child: Center(
                    child: Container(
                      height: 110,
                      child: FortuneWheel(
                        rotationCount:3,
                        animateFirst: false,
                        selected: selected2,
                        duration:Duration(seconds: 20),

                        physics: CircularPanPhysics(
                          duration: Duration(seconds: 1),
                          curve: Curves.decelerate,
                        ),

                        styleStrategy: UniformStyleStrategy(
                          textAlign:TextAlign.end,
                          borderColor: Color(0xFFFFC501),
                          color: Color(0xFF640000),
                          borderWidth: 0.5,
                        ),
                        indicators: const <FortuneIndicator>[
                          FortuneIndicator(

                              alignment: Alignment
                                  .topCenter, // <-- changing the position of the indicator
                              child: Text('')
                          ),
                        ],

                        items: [
                          for (var it in items) FortuneItem(child:
                          Padding(
                              padding:  EdgeInsets.only(left: 40.0),
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: it=='1'?Image.asset('assets/roulette/ball.png',color: Colors.white, height: 5,width: 5,):Text(''),
                              ))),
                        ],
                        onAnimationEnd: () {
                          print("Value : " + "$selected2");
                        },
                      ),
                    ),
                  )),



                  Center(
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: Color(0xffe12c76),
                      child: Center(child: Image.asset('assets/roulette/centerm.png'),

                      ),
                    ),
                  ),

                ],
              ),
            );
          },

        ),
      ),
    );
  }
}


final number = <int>[
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36
];