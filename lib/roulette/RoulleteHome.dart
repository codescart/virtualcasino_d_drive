import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:virtualcasino/constant/apihelper.dart';
import 'package:virtualcasino/customappbar/customappbar.dart';
import 'package:virtualcasino/roulette/CasinoBoard.dart';
import 'package:virtualcasino/roulette/RouletteUpper.dart';
import 'package:virtualcasino/roulette/casino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;


class ClockModel {

  late int hour;
  late int minute;
  late int second;
  late bool is24HourFormat;

  get is24HourTimeFormat => this.is24HourFormat;
}
class RoulleteHome extends StatefulWidget {
  const RoulleteHome({Key? key}) : super(key: key);

  @override
  State<RoulleteHome> createState() => _RoulleteHomeState();
}

class _RoulleteHomeState extends State<RoulleteHome> {
  int tom=0;
  late double percent;

  late DateTime _dateTime;
  late ClockModel _clockModel;
  late Timer _timer;

  final AudioCache _player = AudioCache();

  @override
  void initState() {
    bowes();
    wallet();
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
    }
    if(watch==50){

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
  sound()async{
    final prefs = await SharedPreferences.getInstance();
    final soundsl= await prefs.getBool('sounds')??false;
    soundsl ==false?print('ok'):
    await _player.play('audio/click_sound.mp3');
  }
  @override
  Widget build(BuildContext context) {
    final widths = 630.0;
    final heights = 290.0;
    return SafeArea(
        child: Scaffold(

          body: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage('assets/roulette/rolettbg.png',),
                    fit: BoxFit.fill,
                  )
              ),
              child:Stack(
                clipBehavior: Clip.none,
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
                      top: -100,
                      right: 37,
                      child: Transform(
                       transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(-20),
                        child: Container(
                        height: 550,
                        width: 300,
                        child: Casino()),
                  )),
                  Positioned(
                      left: 40,
                      child:Column(
                        children: [
                          InkWell(
                            onTap: (){
                            },
                            child: Container(
                              height: 45,
                              width: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/home/wallet.png'),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(top:2,bottom: 2,left: 15),
                                    child:  Container(
                                      child: Center(
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,

                                          radius: 20,
                                          backgroundImage:photo!=null? NetworkImage("https://casino.foundercodes.com/uploads/"+photo.toString()):
                                          NetworkImage("https://cdn-icons-png.flaticon.com/512/149/149071.png"),
                                          child:
                                          CircleAvatar(
                                              backgroundColor: Colors.transparent,
                                              radius: 30,
                                              backgroundImage:AssetImage('assets/home/userprofile.png')
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 11,),
                                  Text(amount.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                    fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,
                                  ),
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                              height: 30,
                              padding: EdgeInsets.only(left: 10, right: 10,top: 2, bottom: 2),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Score: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14),),
                                  Text(' $score', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14),),
                                ],
                              )),

                        ],
                      )

                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.rotate(
                              angle: -math.pi / 7,
                              // turns: new AlwaysStoppedAnimation(15 / 360),
                                // ..setEntry(1, 2, 0.001)
                                // ..rotateY(50),
                              child: InkWell(
                                // onTap: (){
                                //   showDialog(
                                //       context: context,
                                //       builder: (ctx) =>
                                //           AlertDialog(
                                //             backgroundColor: Colors.transparent,
                                //             title: Container(
                                //                 decoration: BoxDecoration(
                                //                     border: Border.all(
                                //                       color: Color(0xffffd700),
                                //                       width: 4,
                                //                     ),
                                //                     color: Colors.black,
                                //                     borderRadius: BorderRadius.all(Radius.circular(50))
                                //                 ),
                                //                 child: Center(child: Text('', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),))),
                                //             content: Container(
                                //                 child:  RouletteLayout(widths: 150,heights: 150,),
                                //            )
                                //           ),
                                //   );
                                // },
                                child: Container(
                                child: RouletteLayout(widths: 260,heights: 150,)
                                ),
                              )
                          ),
                        ],
                      ),
                      SizedBox(),

                    ],
                  ),
                  Positioned(
                    bottom: 15,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/home/bg_rank_03.png'),
                            fit: BoxFit.fill
                        ),
                      ),
                      child: InkWell(
                        onTap:(){
                          showDialog(
                              context: context,
                              builder: (ctx) =>
                                  AlertDialog(
                                      backgroundColor: Colors.black.withOpacity(0.5),
                                      title:   Container(
                                          height:50,
                                          width: 150,
                                          padding: EdgeInsets.only(left: 10, right: 10,top: 2, bottom: 2),

                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage('assets/fun/button3.png'),
                                                fit: BoxFit.fill
                                            ),

                                          ),
                                          child: Center(child: Text('Previous Result', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellowAccent, fontSize: 10),))),
                                      content: Container(
                                        height: 120,
                                        width: 100,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text("Result",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                    fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white
                                                ),
                                                ),),


                                                Text("Date & Time",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                    fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white
                                                ),
                                                ),),

                                                Text("Score : $score",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                    fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white
                                                ),
                                                ),),
                                              ],
                                            ),
                                            Divider(color: Colors.red,thickness: 1.5,),

                                            Expanded(
                                              child: FutureBuilder<List<Alb>>(
                                                  future: bowe(),
                                                  builder: (context, snapshot) {
                                                    if (snapshot.hasError) print(snapshot.error);
                                                    return snapshot.hasData
                                                        ? ListView.builder(
                                                        itemCount: snapshot.data!.length,
                                                        itemBuilder: (BuildContext context,int index)=>
                                                            Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text(snapshot.data![index].result.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                                      fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,
                                                                    ),
                                                                    ),
                                                                    ),
                                                                    Text(snapshot.data![index].datetime.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                                      fontSize: 13,fontWeight: FontWeight.bold,color: Colors.white,
                                                                    ),
                                                                    ),
                                                                    ),
                                                                    Text(snapshot.data![index].gamesno.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                                      fontSize: 13,fontWeight: FontWeight.bold,color: Colors.white,
                                                                    ),
                                                                    ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            )
                                                    ) :Center(child:CircularProgressIndicator(color: Colors.red,));
                                                  }
                                              ),
                                            ),


                                          ],
                                        ),
                                      )
                                  )
                          );
                        },
                        child: Container(
                            height: 30,
                            padding: EdgeInsets.only(left: 10, right: 10,top: 2, bottom: 2),

                            child: Center(child:
                            Text("Last 5:|$res1| $res2 | $res3 |$res4 |$res5 ",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13),
                            )
                            )),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 210,
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage("assets/fun/cllock.png",),

                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(top: 15, left: 1),
                        child: Center(
                          child: CircularPercentIndicator(
                            radius: 36,
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
                  ),

                ],
              )
            ),
          ),
        ));
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
        "gameno":"6",
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



  var res5='0';
  var res1='0';
  var res2='0';
  var res3='0';
  var res4='0';
  var score='0';
  List<Alb> allroundsd = [];
  Future<List<Alb>> bowes() async{
    final response = await http.get(
      Uri.parse("https://casino.foundercodes.com/index.php/Mobile_app/demo?gameid=3"),
    );
    var jsond = json.decode(response.body)["data"];
    print(jsond);
    setState(() {
      allroundsd = json.decode(response.body)["data"];

      res5=jsond[5]["result"];
      res1=jsond[1]["result"];
      res2=jsond[2]["result"];
      res3=jsond[3]["result"];
      res4=jsond[4]["result"];
      score=jsond[0]["gamesno"];
    });

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
        "gameno":"6",
      }),

    );
    print( "user_id"+"$value"+
        "gamesno"+"$score"+
        "gameno"+"6");
    print("visal");

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

  // var res5='0';
  // var res1='0';
  // var res2='0';
  // var res3='0';
  // var res4='0';
  // var score='0';
  // Future<List<Alb>> rouletescore() async{
  //   final response = await http.get(
  //     Uri.parse("https://casino.foundercodes.com/index.php/Mobile_app/demo?gameid=4"),
  //   );
  //   var jsond = json.decode(response.body)["data"];
  //   print(jsond);
  //   setState(() {
  //     res5=jsond[5]["result"];
  //     res1=jsond[1]["result"];
  //     res2=jsond[2]["result"];
  //     res3=jsond[3]["result"];
  //     res4=jsond[4]["result"];
  //     score=jsond[0]["gamesno"];
  //   });
  //   final prefs= await SharedPreferences.getInstance();
  //   prefs.setString('funtragetsno', score);
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

  Future<List<Albb>> bow() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    final response = await http.get(
      Uri.parse(Apiconstant.baseurl+'betloghistory?user_id=$value&gameid=6&gamesno=$score'),
    );
    print(score);

    print(Apiconstant.baseurl+'betloghistory?user_id=$value&gameid=3&gamesno=6');
    print("ary");
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



  Future<List<Alb>> bowe() async{
    final response = await http.get(
      Uri.parse("https://casino.foundercodes.com/index.php/Mobile_app/demo?gameid=4"),
    );
    var jsond = json.decode(response.body)["data"];
    print(jsond);
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

  var amount='0';
  var name='Your Name';
  var photo;
  var number='123546781';
  wallet() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";

    final response = await http.get(
      Uri.parse(Apiconstant.baseurl + 'profile_get?user_id=$value'),
    );

    final jsond = json.decode(response.body)["data"];
    setState(() {
      var fda=jsond[0];
      amount=fda["wallet"];
      name= fda["full_name"];
      photo= fda["photo"];
      number=fda["mobile"];
    });
    print(jsond);

  }
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
