import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class ClockModel {

  late int hour;
  late int minute;
  late int second;
  late bool is24HourFormat;

  get is24HourTimeFormat => this.is24HourFormat;
}
class FunSpinWheel extends StatefulWidget {
  @override
  _FunSpinWheelState createState() => _FunSpinWheelState();
}

class _FunSpinWheelState extends State<FunSpinWheel> {
  late DateTime _dateTime;
  late ClockModel _clockModel;
  late Timer _timer;
  int tom=0;
  int selected = 0;
  int selecteds = 0;


  final items = <String>[
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9'

  ];

  final AudioCache _player = AudioCache();
  @override
  void initState() {
    sound();
    setState(() {
      selected=0;

    });
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
      Navigator.pop(context);
      print("done");

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

    final res= await http.get(Uri.parse('https://casino.foundercodes.com/demo/betserial/funtargetres.php'));
    final data = jsonDecode(res.body);

    var myInt1 = int.parse(data['result']);



    setState(() {
      selected=myInt1;
      selecteds=myInt1;

    });

  }
  // popstop(){
  //   print(pop);
  //   WidgetsBinding.instance?.addPostFrameCallback((_) {
  //     pop==true
  //         ?         showDialog(
  //         context: context!,
  //
  //         barrierDismissible: false,
  //         builder: (ctx) =>
  //
  //             AlertDialog(
  //
  //               backgroundColor: Colors.transparent,
  //               content:Container(
  //                 height: 200,
  //                 width: 200,
  //                 child: Stack(
  //                   children: [
  //                     Positioned(
  //                         child:
  //                         Center(
  //                           child: Container(
  //                             decoration: BoxDecoration(
  //                                 image: DecorationImage(
  //                                     image: AssetImage("assets/home/framefun.png")
  //                                 )),
  //                             height: 200,
  //                             child: Padding(
  //                               padding: const EdgeInsets.all(24.0),
  //                               child: FortuneWheel(
  //                                 animateFirst: true,
  //                                 selected: selecteds,
  //                                 physics: CircularPanPhysics(
  //                                   duration: Duration(seconds: 10),
  //                                   curve: Curves.decelerate,
  //                                 ),
  //
  //                                 styleStrategy: UniformStyleStrategy(
  //                                   textAlign:TextAlign.end,
  //                                   borderColor: Color(0xFFCE0387),
  //                                   color:
  //                                   Color(0xFFE0AA3E),
  //
  //                                   borderWidth: 1,
  //                                 ),
  //                                 indicators: const <FortuneIndicator>[
  //                                   FortuneIndicator(
  //                                       alignment: Alignment
  //                                           .topCenter, // <-- changing the position of the indicator
  //                                       child: Icon(Icons.favorite_border_outlined, color: Color(0xffffd700),)
  //                                   ),
  //                                 ],
  //
  //                                 items: [
  //                                   for (var it in items) FortuneItem(child:
  //                                   Padding(
  //                                     padding:  EdgeInsets.only(left: 52.0),
  //                                     child: RotatedBox(
  //                                         quarterTurns: 1,
  //                                         child: Text(it, style: TextStyle(fontSize: 15, fontWeight:FontWeight.w700,color: Color(
  //                                             0xff000000)),)),
  //                                   )),
  //                                 ],
  //                                 onAnimationEnd: () {
  //                                   print("Value : " + "$selected");
  //                                 },
  //                               ),
  //                             ),
  //                           ),
  //                         )),
  //
  //                     Center(
  //                       child: CircleAvatar(
  //                           radius: 55,
  //                           backgroundColor: Color(0xffe12c76),
  //                           child: Image.asset('assets/fun/center.png')
  //                       ),
  //                     ),
  //
  //
  //                   ],
  //                 ),
  //               ),
  //             )):"";
  //   });
  // }
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
        showDialog(
            context: context!,
            builder: (ctx) =>
                AlertDialog(
                  backgroundColor: Colors.transparent,
                  content:Container(
                    height: 200,
                    width: 200,
                    child: Stack(
                      children: [
                        Positioned(
                            child:
                            InkWell(
                              onTap: (){
                                sound();

                                setState(() {
                                  selected=2;
                                });
                              },
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("assets/home/framefun.png")
                                      )),
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: FortuneWheel(
                                      animateFirst: false,
                                      selected: selected,
                                      physics: CircularPanPhysics(
                                        duration: Duration(seconds: 10),
                                        curve: Curves.decelerate,
                                      ),

                                      styleStrategy: UniformStyleStrategy(
                                        textAlign:TextAlign.end,
                                        borderColor: Color(0xFFCE0387),
                                        color:
                                        Color(0xFFE0AA3E),

                                        borderWidth: 1,
                                      ),
                                      indicators: const <FortuneIndicator>[
                                        FortuneIndicator(
                                            alignment: Alignment
                                                .topCenter, // <-- changing the position of the indicator
                                            child: Icon(Icons.favorite_border_outlined, color: Color(0xffffd700),)
                                        ),
                                      ],

                                      items: [
                                        for (var it in items) FortuneItem(child:
                                        Padding(
                                          padding:  EdgeInsets.only(left: 52.0),
                                          child: RotatedBox(
                                              quarterTurns: 1,
                                              child: Text(it, style: TextStyle(fontSize: 15, fontWeight:FontWeight.w700,color: Color(
                                                  0xff000000)),)),
                                        )),
                                      ],
                                      onAnimationEnd: () {
                                        print("Value : " + "$selected");
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            )),

                        Center(
                          child: CircleAvatar(
                              radius: 55,
                              backgroundColor: Color(0xffe12c76),
                              child: Image.asset('assets/fun/center.png')
                          ),
                        ),


                      ],
                    ),
                  ),
                ));
      },
      child: Container(

        child: Stack(

          children: [

            Positioned(
                child:
            InkWell(
              onTap: (){
                sound();
                setState(() {
                  selected=2;


                });
              },
              child: Center(
                child: Container(
               decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/home/framefun.png")
                         )),
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: FortuneWheel(
                      animateFirst: false,
                      selected: selected,
                      physics: CircularPanPhysics(
                        duration: Duration(seconds: 10),
                        curve: Curves.decelerate,
                      ),

                      styleStrategy: UniformStyleStrategy(
                        textAlign:TextAlign.end,
                        borderColor: Color(0xFFCE0387),
                        color:
                        Color(0xFFE0AA3E),

                        borderWidth: 1,
                      ),
                      indicators: const <FortuneIndicator>[
                        FortuneIndicator(
                            alignment: Alignment
                                .topCenter, // <-- changing the position of the indicator
                            child: Icon(Icons.favorite_border_outlined, color: Color(0xffffd700),)
                        ),
                      ],

                      items: [
                        for (var it in items) FortuneItem(child:
                        Padding(
                          padding:  EdgeInsets.only(left: 52.0),
                          child: RotatedBox(
                              quarterTurns: 1,
                              child: Text(it, style: TextStyle(fontSize: 15, fontWeight:FontWeight.w700,color: Color(
                                  0xff000000)),)),
                        )),
                      ],
                      onAnimationEnd: () {
                        print("Value : " + "$selected");
                      },
                    ),
                  ),
                ),
              ),
            )),

            Center(
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Color(0xffe12c76),
                child: Image.asset('assets/fun/center.png')
                ),
              ),


          ],
        ),
      ),
    );
  }
}
