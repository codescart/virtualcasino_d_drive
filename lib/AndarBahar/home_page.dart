import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:virtualcasino/clock/clock.dart';
import 'package:virtualcasino/clock/clock_text.dart';
import 'package:virtualcasino/constant/apihelper.dart';
import 'package:virtualcasino/dragonTiger/Flips.dart';
import 'package:http/http.dart' as http;

import '../customappbar/customappbar.dart';
import 'package:percent_indicator/percent_indicator.dart';


class ClockModel {

  late int hour;
  late int minute;
  late int second;
  late bool is24HourFormat;

  get is24HourTimeFormat => this.is24HourFormat;
}
class HOME_PAGE extends StatefulWidget {
  const HOME_PAGE({Key? key}) : super(key: key);

  @override
  State<HOME_PAGE> createState() => _HOME_PAGEState();
}

class _HOME_PAGEState extends State<HOME_PAGE> {
  late double percent;

  late DateTime _dateTime;
  late ClockModel _clockModel;
  late Timer _timer;
int tom=0;

  final AudioCache _player = AudioCache();
  static const List data= <int>[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36];
  final red = {1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36};
  static const List batval= <String>['1','2','5','10','20','50', '100','200','500','1000','2000','5000'];

  static const List batvals= <String>['assets/chips/1_0.png','assets/chips/2_0.png','assets/chips/5_0.png','assets/chips/10_0.png','assets/chips/20_0.png','assets/chips/50_0.png','assets/chips/100_0.png','assets/chips/200_0.png','assets/chips/500_0.png','assets/chips/1000_0.png','assets/chips/2000_0.png','assets/chips/5000_0.png'];
  static const List colord= <Color>[Color(0xff009316), Color(0xff0741d0), Color(0xff6c0303), Color(0xffd9b149), Color(0xff069a7f), Color(0xffbb1a82),
    Color(0xff9d4303), Color(0xff6581f8)
  ];
  @override
  void initState() {
    boweeee();
    sound();
    pank();
    // TODO: implement initState
    super.initState();

    _dateTime = DateTime.now();
    _clockModel = ClockModel();
    _clockModel.is24HourFormat =  true;

    _dateTime = DateTime.now();
    _clockModel.hour = _dateTime.hour;
    _clockModel.minute = _dateTime.minute;
    _clockModel.second = _dateTime.second;

    print('pj');
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _dateTime = DateTime.now();
      _clockModel.hour = _dateTime.hour;
      _clockModel.minute = _dateTime.minute;
      _clockModel.second = _dateTime.second;
      // print(_clockModel.second);
      setState(() {
        tom=_clockModel.second;
      });
     // timest();
    });
  }

  // var pop=false;
  // timest(){
  //   // var times =tom.toString();
  //   print(tom.toString());
  //   var watch=tom;
  //   if(watch ==59 ){
  //     Navigator.pop(context);
  //   }
  //   if(watch==50){
  //     setState(() {
  //       pop=true;
  //     });
  //     popstop();
  //
  //   }else {
  //     setState(() {
  //       pop = false;
  //     });
  //   }
  //   print(watch);
  //   print(pop);
  // }
  // popstop(){
  //   print(pop);
  //   WidgetsBinding.instance?.addPostFrameCallback((_) {
  //     pop==true
  //         ?   showDialog(
  //         context: context!,
  //         builder: (ctx) =>
  //             AlertDialog(
  //               backgroundColor: Colors.transparent,
  //               title: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Text("ANDAR",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
  //                       fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
  //                   ),
  //                   ),),
  //                 ],
  //               ),
  //               content: Container(
  //                 height: MediaQuery.of(context).size.height * 0.8,
  //                 child: SingleChildScrollView(
  //                   scrollDirection: Axis.horizontal,
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Container(
  //                           height: MediaQuery.of(context).size.height * 0.4,
  //                           width: MediaQuery.of(context).size.width,
  //                           // decoration: BoxDecoration(
  //                           //     image: new DecorationImage(
  //                           //       image: new AssetImage("assets/new/dra2.gif",),
  //                           //       fit: BoxFit.fill,
  //                           //     )
  //                           // ),
  //                           child:LiveGrid(
  //                               padding: EdgeInsets.all(5),
  //                               showItemInterval: Duration(milliseconds: 500),
  //                               showItemDuration: Duration(milliseconds: 50),
  //                               visibleFraction: 0.001,
  //                               itemCount: raja.length,
  //                               scrollDirection:Axis.horizontal,
  //                               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                                 crossAxisCount: 2,
  //                                 crossAxisSpacing: 5,
  //                                 mainAxisSpacing: 0,
  //                               ),
  //                               itemBuilder: animationItemBuilder(
  //                                       (index) => Container(
  //                                         alignment: Alignment.center,
  //                                     child: Image.network('${raja[index]}'),
  //                                   )
  //                               )
  //                           )
  //                       ),
  //                       SizedBox(height: 2,),
  //                       Padding(
  //                         padding: const EdgeInsets.only(right:130),
  //                         child: Column(
  //                           children: [
  //                             SizedBox(height: 5,),
  //                             Text("BAHAR",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
  //                                 fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red
  //                             ),
  //                             ),),
  //
  //                           ],
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             )
  //     ):"";
  //   });
  // }
  String ? bat;
  var batam;
  sound()async{
    final prefs = await SharedPreferences.getInstance();
    final soundsl= await prefs.getBool('sounds')??false;
    soundsl ==false?print('ok'):
    await _player.play('audio/click_sound.mp3');
  }
  soundcoin()async{
    final prefs = await SharedPreferences.getInstance();
    final soundsl= await prefs.getBool('sounds')??false;
    soundsl ==false?print('ok'):
    await _player.play('audio/coin.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
             // color: Colors.red,
              image: DecorationImage(
                image: AssetImage('assets/dragon/TIE.png',),fit: BoxFit.fill,
              )
          ),
          child: Stack(
            children: [
              Positioned(
                  child:InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/home/btn_back.png'),
                        ),
                      ),
                    ),
                  )

              ),
              Positioned(
                  right: -10,
                  child:InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/home/wallet.png'),
                        ),
                      ),
                    ),
                  )

              ),
              Positioned(
                  top: MediaQuery.of(context).size.height*0.1,
                  left: MediaQuery.of(context).size.width*0.54,
                  child:  Row(
                    children: [
                      Text("Last 5: |",
                          //+"| $res2 | $res3 |$res4 |$res5 ",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14),),
                      res1=='1'?CircleAvatar(
                        radius: 10,
                        child: Center(child: Text('A')),):CircleAvatar(backgroundColor: Colors.red ,radius: 10,child: Text('B')),
                      Text('|', style: TextStyle(color: Colors.white),),
                      res2=='1'?CircleAvatar(
                        radius: 10,
                        child: Center(child: Text('A')),):CircleAvatar(backgroundColor: Colors.red ,radius: 10,child: Text('B')),
                      Text('|', style: TextStyle(color: Colors.white),),
                      res3=='1'?CircleAvatar(
                        radius: 10,
                        child: Center(child: Text('A')),):CircleAvatar(backgroundColor: Colors.red ,radius: 10,child: Text('B')),
                      Text('|', style: TextStyle(color: Colors.white),),
                      res4=='1'?CircleAvatar(
                        radius: 10,
                        child: Center(child: Text('A')),):CircleAvatar(backgroundColor: Colors.red ,radius: 10,child: Text('B')),
                      Text('|', style: TextStyle(color: Colors.white),),
                      res5=='1'?CircleAvatar(
                        radius: 10,
                        child: Center(child: Text('A')),):CircleAvatar(backgroundColor: Colors.red ,radius: 10,child: Text('B')),
                      Text('|', style: TextStyle(color: Colors.white),),

                    ],
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.height*0.09,
                  left: MediaQuery.of(context).size.width*0.26,
                  child:   Text('Score: $score', style:
                  TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.white, fontSize: 18),
                  )
              ),
              Positioned(
                top: MediaQuery.of(context).size.height*0.19,
                left: MediaQuery.of(context).size.width*0.26,
                child: Container(
                height: 65,
                width: 300,
                child:LiveGrid(
                    padding: EdgeInsets.all(5),
                    showItemInterval: Duration(milliseconds: 500),
                    showItemDuration: Duration(milliseconds: 50),
                    visibleFraction: 0.001,
                    itemCount: raja.length,
                    scrollDirection:Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 3,
                    ),
                    itemBuilder: animationItemBuilder(
                            (index) => Container(
                          child: Image.network('${raja[index]}'),
                        )
                    )
                ),

              ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left:MediaQuery.of(context).size.width*0.15 ,
                        right:MediaQuery.of(context).size.width*0.10,top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                            InkWell(
                              onTap: (){
                                soundcoin();
                                BetregisteredAndar('1');

                              },
                              child: Container(
                                height: 90,
                                width: 150,

                                child: GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5,
                                      //childAspectRatio: 0.90,
                                    ),
                          scrollDirection: Axis.horizontal,
                           itemCount: _laim.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CircleAvatar(
                              radius: 5,
                              child: Image.asset(_laim[index]),
                            );
                          }),
                              ),
                            ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            image: new DecorationImage(
                              image: new AssetImage("assets/fun/cllock.png",),

                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(top: 20, left: 1),
                            child: Center(
                              child: CircularPercentIndicator(
                                radius: 40,
                                animation: true,
                                animationDuration: 1200,
                                lineWidth: 4.0,
                                percent: tom/60,
                                center: Text(tom.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                    fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                ),
                                ),),
                                circularStrokeCap: CircularStrokeCap.butt,
                                backgroundColor: Colors.transparent,
                                progressColor: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            soundcoin();
                            BetregisteredAndar('2');
                          },
                           child: Container(
                          height: 90,
                          width: 150,

                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              //childAspectRatio: 0.90,
                            ),
                              scrollDirection: Axis.horizontal,
                              itemCount: _lbim.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CircleAvatar(
                                  radius: 5,
                                  child: Image.asset(_lbim[index]),
                                );
                              }, ),
                        ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 50,
                    width: 550,
                    child: ListView.builder(
                      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 4),
                        scrollDirection: Axis.horizontal,
                        itemCount: batval.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            child: Padding(
                              padding: EdgeInsets.all(2),
                              child: Container(


                                child: InkWell(
                                  onTap: (){
                                    sound();
                                    setState(() {
                                      batam= batval[index].toString();
                                      batimg= batvals[index].toString();
                                    });
                                    // BetregisteredAndar("Andar",batval[index].toString());
                                  },
                                  child: CircleAvatar(
                                    // backgroundColor: colord[index],
                                    radius: 20,
                                    child: Image.asset(batvals[index].toString()),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                  // Container(
                  //   height: 62,
                  //   width: 170,
                  //   decoration: BoxDecoration(
                  //     // borderRadius: BorderRadius.circular(30),
                  //     border: Border.all(color: Colors.yellow,width: 1),
                  //     gradient: LinearGradient(
                  //       begin: Alignment.topLeft,
                  //       end: Alignment.bottomRight,
                  //       colors: [
                  //         Color(0xffea0909),
                  //         Color(0xffcc0707),
                  //         Color(0xff8d0303),
                  //         Color(0xff570000),
                  //       ],
                  //     ),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         blurRadius: 25.0,
                  //       ),
                  //     ],
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Row(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.only(top:2),
                  //             child: Image.asset("assets/new/beep.gif",height: 30,width: 30,),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsets.only(top:3),
                  //             child: Text("Live  ",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                  //                 fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                  //             ),
                  //             ),),
                  //           ),
                  //           DigitalClock(
                  //             hourMinuteDigitTextStyle: Theme.of(context)
                  //                 .textTheme
                  //                 .headline6!
                  //                 .copyWith(color: Colors.white),
                  //             secondDigitTextStyle: Theme.of(context)
                  //                 .textTheme
                  //                 .caption!
                  //                 .copyWith(color: Colors.white),
                  //             colon: Text(
                  //               ":",
                  //               style: Theme.of(context)
                  //                   .textTheme
                  //                   .subtitle1!
                  //                   .copyWith(color: Colors.white),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       Container(
                  //         height: 15,
                  //         width: 170,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(30),
                  //           border: Border.all(color: Colors.transparent,width: 1),
                  //
                  //
                  //         ),
                  //         child: Marquee(
                  //           text: 'Andar Bahar casino welcome you we have a game for you Andar Bahar give a more money to make.',
                  //           style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                  //           scrollAxis: Axis.horizontal,
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           blankSpace: 20.0,
                  //           velocity: 100.0,
                  //           pauseAfterRound: Duration(seconds: 1),
                  //           startPadding: 10.0,
                  //           accelerationDuration: Duration(seconds: 1),
                  //           accelerationCurve: Curves.linear,
                  //           decelerationDuration: Duration(milliseconds: 500),
                  //           decelerationCurve: Curves.easeOut,
                  //         ),
                  //       ),
                  //
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  var res5='0';
  var res1='0';
  var res2='0';
  var res3='0';
  var res4='0';
  var score='0';
  Future<List<Albbb>> boweeee() async{
    final response = await http.get(
      Uri.parse("https://casino.foundercodes.com/index.php/Mobile_app/demo?gameid=4"),
    );
    var jsond = json.decode(response.body)["data"];

    print(jsond);
    setState(() {
      res5=jsond[5]["result"];
      res1=jsond[1]["result"];
      res2=jsond[2]["result"];
      res3=jsond[3]["result"];
      res4=jsond[4]["result"];
      score=jsond[0]["gamesno"];
    });
    final prefs= await SharedPreferences.getInstance();
    prefs.setString('funtragetsno', score);
    List<Albbb> allround = [];
    for (var o in jsond)  {
      Albbb al = Albbb(
        o["id"],
        o["gameid"],
        o["result"],
        o["gamesno"],
        o["auto"],
        o["gametable"],
        o["autobytime"],
        o["status"],
        o["datetime"],
        o["gametype"],
      );
      allround.add(al);
    }
    return allround;
  }
  var batimg;

  List _laim = [];
  List _lbim = [];
  BetregisteredAndar(String btm)async {

    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    final gamesno = prefs.getString('funtragetsno') ?? "0";
    print('pankaj');
    print("$btm $batam");
    final response = await http.post(
      Uri.parse(
          Apiconstant.baseurl + "bet"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      body: jsonEncode(<String, String>{
        "user_id":"$value",
        "gamesno":"$gamesno",
        "amount":batam,
        "gameid":"2",
        "betno":btm,
      }),
    );
    final data = jsonDecode(response.body);
    print(data);
    print("hello");
    if (data['error'] == "200") {
      if(btm=='1'){
        _laim.add(batimg);
        print('laaaaaaaa');
        // print(_la+_laim);
        // _la.add(,'e');
      }else{
        _lbim.add(batimg);

      }
      // Fluttertoast.showToast(
      //     msg: "Bet done successfully",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.green,
      //     textColor: Colors.white,
      //     fontSize: 16.0
      // );
      print("object");

      print("Nan");
      // final otp=data['otp'];
      // final prefs1 = await SharedPreferences.getInstance();
      // final key1 = 'user_id';
      // final mobile = data['data']['id'] ;
      // prefs1.setString(key1, mobile);

      print("BetAnadrbhar Done SucessFully");
    } else {
      // signup();
      print("Bet not registerd");
      Fluttertoast.showToast(
          msg: data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }
  var raja=[];
  pank()async{
    final response = await http.get(
    Uri.parse('https://casino.foundercodes.com/demo/betserial/andar_bahar_res.php'),
    );
    print('pankaj');
    final jsond = json.decode(response.body)['result'];
    setState(() {
     raja= jsond;
    });
  }

//   Future<List<Alb>> bowe() async{
//   final response = await http.get(
//     Uri.parse('https://casino.foundercodes.com/demo/betserial/andar_bahar_res.php'),
//   );
//   print('pankaj');
//   final jsond = json.decode(response.body)['result'];
//   print(jsond);
//   List<Alb> allround = [];
//   for ( var o in jsond)  {
//     Alb al = Alb(
//       o[0],
//     );
//     allround.add(al);
//   }
//   return allround;
// }
}
class Alb {
  String? image;
  Alb(
      this.image,
      );

}

Widget Function(
    BuildContext context,
    int index,
    Animation<double> animation,
    ) animationItemBuilder(
    Widget Function(int index) child, {
      EdgeInsets padding = EdgeInsets.zero,
    }) =>
        (
        BuildContext context,
        int index,
        Animation<double> animation,
        ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, -0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child(index),
            ),
          ),
        );

class Albbb {
  String? id;
  String? gameid;
  String? result;
  String? gamesno;
  String? auto;
  String? gametable;
  String? autobytime;
  String? status;
  String? datetime;
  String? gametype;


  Albbb(this.id,
      this.gameid,
      this.result,
      this.gamesno,
      this.auto,
      this.gametable,
      this.autobytime,
      this.status,
      this.datetime,
      this.gametype);

}

