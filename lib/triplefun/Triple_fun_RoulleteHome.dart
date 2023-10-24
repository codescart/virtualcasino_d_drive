import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:virtualcasino/Wallet/pageWalllet.dart';
import 'package:virtualcasino/customappbar/customappbar.dart';
import 'package:virtualcasino/triplefun/GridData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:virtualcasino/triplefun/Tripal_fun_number_list.dart';
import 'package:virtualcasino/triplefun/Tripelfun_CasinoBoard.dart';
import 'package:virtualcasino/triplefun/Triple_fun_Upper.dart';
import 'package:virtualcasino/triplefun/spinwheelscreen.dart';
import 'package:virtualcasino/triplefun/tab_test.dart';

import '../constant/apihelper.dart';

class ClockModel {

  late int hour;
  late int minute;
  late int second;
  late bool is24HourFormat;

  get is24HourTimeFormat => this.is24HourFormat;
}
class Triple_fun_RoulleteHome extends StatefulWidget {
  const Triple_fun_RoulleteHome({Key? key}) : super(key: key);

  @override
  State<Triple_fun_RoulleteHome> createState() => _Triple_fun_RoulleteHomeState();
}

class _Triple_fun_RoulleteHomeState extends State<Triple_fun_RoulleteHome> {




  int tom=0;
  late double percent;

  late DateTime _dateTime;
  late ClockModel _clockModel;
  late Timer _timer;

  final AudioCache _player = AudioCache();

  @override
  void initState() {
    sound();
    bowee();
    // bowe();

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
  //
  //
  //   if(watch==50){
  //
  //
  //   }else {
  //
  //   }
  //
  //
  //   print(watch);
  //   print(pop);
  // }

  sound()async{
    final prefs = await SharedPreferences.getInstance();
    final soundsl= await prefs.getBool('sounds')??false;
    soundsl ==false?print('ok'):
    await _player.play('audio/click_sound.mp3');
  }
  @override
  Widget build(BuildContext context) {
    // final widths = 630.0;
    // final heights = 290.0;
    return SafeArea(
        child: Scaffold(


          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/home/triplebg.png'),
                  fit: BoxFit.fill,
                )
            ),
            child:Stack(
              children: [
                ///clock
                Positioned(
                    top: 0,
                    left: 40,
                    child: Container(
                      height:50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage("assets/fun/cllock.png",),

                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 1),
                        child: Center(
                          child: CircularPercentIndicator(
                            radius: 25,
                            animation: true,
                            animationDuration: 1200,
                            lineWidth: 2.5,
                            percent: tom/60,
                            center: Text(tom.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white
                            ),
                            ),),
                            circularStrokeCap: CircularStrokeCap.butt,
                            backgroundColor: Colors.transparent,
                            progressColor: Colors.red,
                          ),
                        ),
                      ),
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       InkWell(
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
                       ),
                       InkWell(
                         onTap: (){
                           sound();
                         },
                         child: Container(
                             height: 40,
                             padding: EdgeInsets.only(left: 10, right: 10,top: 2, bottom: 2),

                             decoration: BoxDecoration(
                               image: DecorationImage(
                                   image: AssetImage('assets/home/bg_chip.png'),
                                   fit: BoxFit.fill
                               ),
                             ),
                             child: Center(child: Text('Score : $score', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10),))),
                       ),
                       InkWell(
                         onTap: (){
                           sound();

                           //   showDialog(
                           //     context: context,
                           //     builder: (ctx) =>
                           //         AlertDialog(
                           //             backgroundColor: Colors.black.withOpacity(0.5),
                           //             title:   Container(
                           //                 height:50,
                           //                 width: 150,
                           //                 padding: EdgeInsets.only(left: 10, right: 10,top: 2, bottom: 2),
                           //                 decoration: BoxDecoration(
                           //                   image: DecorationImage(
                           //                       image: AssetImage('assets/fun/button3.png'),
                           //                       fit: BoxFit.fill
                           //                   ),
                           //
                           //                 ),
                           //                 child: Center(child: Text('Previous Result', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellowAccent, fontSize: 10),))),
                           //             content: Container(
                           //               height: 120,
                           //               width: 100,
                           //               child: Column(
                           //                 mainAxisAlignment: MainAxisAlignment.start,
                           //                 crossAxisAlignment: CrossAxisAlignment.center,
                           //                 children: [
                           //                   Row(
                           //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           //                     crossAxisAlignment: CrossAxisAlignment.start,
                           //                     children: [
                           //
                           //                       Text("Result",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                           //                           fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white
                           //                       ),
                           //                       ),),
                           //
                           //
                           //                       Text("Date & Time",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                           //                           fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white
                           //                       ),
                           //                       ),),
                           //
                           //                       Text("Score",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                           //                           fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white
                           //                       ),
                           //                       ),),
                           //                     ],
                           //                   ),
                           //                   Divider(color: Colors.red,thickness: 1.5,),
                           //
                           //                   Expanded(
                           //                     child: FutureBuilder<List<Alb>>(
                           //                         future: bowe(),
                           //                         builder: (context, snapshot) {
                           //                           if (snapshot.hasError) print(snapshot.error);
                           //                           return snapshot.hasData
                           //                               ? ListView.builder(
                           //                               itemCount: snapshot.data!.length,
                           //                               itemBuilder: (BuildContext context,int index)=>
                           //                                   Column(
                           //                                     children: [
                           //                                       Row(
                           //                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           //                                         crossAxisAlignment: CrossAxisAlignment.start,
                           //                                         children: [
                           //                                           Text(snapshot.data![index].result.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                           //                                             fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,
                           //                                           ),
                           //                                           ),
                           //                                           ),
                           //                                           Text(snapshot.data![index].datetime.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                           //                                             fontSize: 13,fontWeight: FontWeight.bold,color: Colors.white,
                           //                                           ),
                           //                                           ),
                           //                                           ),
                           //                                           Text(snapshot.data![index].gamesno.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                           //                                             fontSize: 13,fontWeight: FontWeight.bold,color: Colors.white,
                           //                                           ),
                           //                                           ),
                           //                                           ),
                           //                                         ],
                           //                                       )
                           //                                     ],
                           //                                   )
                           //                           ) :Center(child:CircularProgressIndicator(color: Colors.red,));
                           //                         }
                           //                     ),
                           //                   ),
                           //
                           //
                           //                 ],
                           //               ),
                           //             )
                           //         )
                           // );
                         },
                         child: Container(
                             height: 40,
                             padding: EdgeInsets.only(left: 10, right: 10,top: 2, bottom: 2),

                             decoration: BoxDecoration(
                               image: DecorationImage(
                                   image: AssetImage('assets/home/bg_chip.png'),
                                   fit: BoxFit.fill
                               ),
                             ),
                             child: Center(child: Text('Last 5 : $res1|$res2|$res3|$res4|$res5 ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10),))),
                       ),
                       pagewallet(),
                     ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 15,
                              width: 80,
                              padding: EdgeInsets.only(left: 10, right: 10,top: 2, bottom: 2),

                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/fun/double.png'),
                                    fit: BoxFit.fill
                                ),

                              ),
                            ),
                            Container(

                              height: 215,
                              width: 210,
                              child: GridData(nums:''),
                            ),
                          ],
                        ),

                        Container(
                            height: 200,
                            width: 200,
                            child: SpinWheel()),

                        Column(
                          children: [
                            Container(
                              height: 15,
                              width: 80,
                              padding: EdgeInsets.only(left: 10, right: 10,top: 2, bottom: 2),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/fun/triple.png'),
                                    fit: BoxFit.fill
                                ),

                              ),
                            ),
                            Container(
                                height: 250,
                                width: 210,
                                child: report_page()
                              //Tripal_fun_TabBar(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: c,
                      children: [

                        Container(
                          height: 20,
                          width: 80,
                          padding: EdgeInsets.only(left: 10, right: 10,top: 2, bottom: 2),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/fun/single.png'),
                                fit: BoxFit.fill
                            ),

                          ),
                        ),
                        Tripal_fun_number_list(),


                      ],
                    ),
                  ],
                ),
                ///triple
                // Positioned(
                //   top: 0,
                //   right: 0,
                //   child: Container(
                //     decoration: BoxDecoration(
                //         color: Colors.black.withOpacity(0.6),
                //         borderRadius: BorderRadius.only(
                //             topLeft:Radius.circular(10),
                //             topRight:Radius.circular(10),
                //             bottomLeft: Radius.circular(10),
                //             bottomRight: Radius.circular(10)
                //         )
                //     ),
                //     child: Column(
                //       children: [
                //         Container(
                //           height: 20,
                //           width: 80,
                //           padding: EdgeInsets.only(left: 10, right: 10,top: 2, bottom: 2),
                //           decoration: BoxDecoration(
                //             image: DecorationImage(
                //                 image: AssetImage('assets/fun/triple.png'),
                //                 fit: BoxFit.fill
                //             ),
                //
                //           ),
                //         ),
                //         Container(
                //             height: 250,
                //             width: 230,
                //             child: report_page()
                //           //Tripal_fun_TabBar(),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ) ,
          ),
        ));

  }


  var res5='0';
  var res1='0';
  var res2='0';
  var res3='0';
  var res4='0';
  var score='0';
  Future<List<Alb>> bowee() async{
    final response = await http.get(
      Uri.parse("https://casino.foundercodes.com/index.php/Mobile_app/demo?gameid=7"),
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
    List<Alb> allround = [];
    for (var o in jsond)  {
      Alb al = Alb(
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



  DeleteBet(String ?betno)async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    final response = await http.post(
      Uri.parse(
          Apiconstant.baseurl + "betdelete"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "user_id":"$value",
        "gamesno":"$score",
        "gameno":"3",
        "betno" :"$betno"
      }),
    );

    final data = jsonDecode(response.body);
    print(data);
    if (data['error'] == "200") {

      Fluttertoast.showToast(
          msg: "Bet done " + data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

      // final otp=data['otp'];
      // final prefs1 = await SharedPreferences.getInstance();
      // final key1 = 'user_id';
      // final mobile = data['data']['id'] ;
      // prefs1.setString(key1, mobile);


    } else {
      // signup();
      Fluttertoast.showToast(
          msg: "Bet not done",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      print("Bet is Empty/Bet not done");
    }
  }



  Future<List<Albb>> bow() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    final response = await http.get(
      Uri.parse(Apiconstant.baseurl+'betloghistory?user_id=$value&gameid=1&gamesno=$score'),
    );

    final jsond = json.decode(response.body)['data'];
    print(jsond);
    List<Albb> allround = [];
    for (var o in jsond)  {
      Albb al = Albb(
        o["id"],
        o["user_id"],
        o["betno"],
        o["amount"],
        o["gamesno"],
        o["gametype"],
        o["status"],
        o["datetime"],
        o["gameno"],
      );

      allround.add(al);
    }
    return allround;
  }



  bet_history_bet()async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    final response = await http.post(
      Uri.parse(
          Apiconstant.baseurl + "bet_history_bet"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "user_id":"$value",
        "gamesno":"$score",
        "gameno":"1",
      }),
    );
    final data = jsonDecode(response.body);
    print(data);
    if (data['error'] == "200") {

      Fluttertoast.showToast(
          msg: "All  Bet done " + data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

      // final otp=data['otp'];
      // final prefs1 = await SharedPreferences.getInstance();
      // final key1 = 'user_id';
      // final mobile = data['data']['id'] ;
      // prefs1.setString(key1, mobile);


    } else {
      // signup();
      Fluttertoast.showToast(
          msg: "Bet not done",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      print("Bet is Empty/Bet not done");
    }
  }



  // Future<List<Alb>> bowe() async{
  //   final response = await http.get(
  //     Uri.parse("https://casino.foundercodes.com/index.php/Mobile_app/demo?gameid=4"),
  //   );
  //   var jsond = json.decode(response.body)["data"];
  //   print(jsond);
  //   List<Alb> allround = [];
  //   for (var o in jsond)  {
  //     Alb al = Alb(
  //       o["id"],
  //       o["gameid"],
  //       o["result"],
  //       o["gamesno"],
  //       o["auto"],
  //       o["gametable"],
  //       o["autobytime"],
  //       o["status"],
  //       o["datetime"],
  //       o["gametype"],
  //     );
  //     allround.add(al);
  //   }
  //   return allround;
  // }

}

class Alb {
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


  Alb(this.id,
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
class Albb {
  String? id;
  String? user_id;
  String? betno;
  String? amount;
  String? gamesno;
  String? gametype;
  String? status;
  String? datetime;
  String? gameno;

  Albb(this.id,
      this.user_id,
      this.betno,
      this.amount,
      this.gamesno,
      this.gametype,
      this.status,
      this.datetime,
      this.gameno,
      );

}
