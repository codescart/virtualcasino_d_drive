import 'dart:async';
import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:virtualcasino/AndarBahar/home_page.dart';
import 'package:virtualcasino/Wallet/pageWalllet.dart';
import 'package:virtualcasino/constant/apihelper.dart';
import 'package:virtualcasino/customappbar/customappbar.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
class ClockModel {

  late int hour;
  late int minute;
  late int second;
  late bool is24HourFormat;

  get is24HourTimeFormat => this.is24HourFormat;
}
class Dragon_Home extends StatefulWidget {
  const Dragon_Home({Key? key}) : super(key: key);

  @override
  State<Dragon_Home> createState() => _Dragon_HomeState();
}

class _Dragon_HomeState extends State<Dragon_Home> {
  late DateTime _dateTime;
  late ClockModel _clockModel;
  late Timer _timer;
  int tom=0;
  static const List data= <int>[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36];
  final red = {1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36};
  static const List batval= <String>['1','2','5','10','20','50', '100','200','500','1000','2000','5000'];

  static const List batvals= <String>['assets/chips/1_0.png','assets/chips/2_0.png','assets/chips/5_0.png','assets/chips/10_0.png','assets/chips/20_0.png','assets/chips/50_0.png','assets/chips/100_0.png','assets/chips/200_0.png','assets/chips/500_0.png','assets/chips/1000_0.png','assets/chips/2000_0.png','assets/chips/5000_0.png'];
  static const List colord= <Color>[Color(0xff009316), Color(0xff0741d0), Color(0xff6c0303), Color(0xffd9b149), Color(0xff069a7f), Color(0xffbb1a82),
    Color(0xff9d4303), Color(0xff6581f8)
  ];
  final AudioCache _player = AudioCache();

  @override
  void initState() {
    sound();
    boweeee();
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

    if(watch==50){
      setState(() {
        pop=true;
      });

    }else {
      setState(() {
        pop = false;
      });
    }


    print(watch);
    print(pop);
  }
  soundcoin()async{
    final prefs = await SharedPreferences.getInstance();
    final soundsl= await prefs.getBool('sounds')??false;
    soundsl ==false?print('ok'):
    await _player.play('audio/coin.mp3');
  }

  var batam;
  sound()async{
    final prefs = await SharedPreferences.getInstance();
    final soundsl= await prefs.getBool('sounds')??false;
    soundsl ==false?print('ok'):
    await _player.play('audio/click_sound.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: CustomAppBarTwo(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            // color: Colors.red,
              image: DecorationImage(
                image: AssetImage('assets/dragon/Dragon.png',),fit: BoxFit.fill,
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
                right: 0,
                  child:InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: pagewallet(),
                  )

              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    padding: EdgeInsets.only(top: 5),
                    width:MediaQuery.of(context).size.width*0.25,
                    height: MediaQuery.of(context).size.height*0.20,
                    child:FutureBuilder<List<Alb>>(
                        future: bowe(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) print(snapshot.error);
                          return snapshot.hasData
                              ? InkWell(
                            onTap: (){
                              sound();

                            },
                            child: LiveGrid(
                                padding: EdgeInsets.all(5),
                                showItemInterval: Duration(milliseconds: 500),
                                showItemDuration: Duration(milliseconds: 50),
                                visibleFraction: 0.001,
                                itemCount: 2,
                                scrollDirection:Axis.vertical,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 40,
                                  mainAxisSpacing: 0,
                                ),
                                itemBuilder: animationItemBuilder(
                                        (index) => Container(
                                      child: Image.network('${snapshot.data![index].image}'),
                                    )
                                )),
                          ):Container(
                            padding: EdgeInsets.only(top: 5),
                            width:MediaQuery.of(context).size.width*0.25,
                            height: MediaQuery.of(context).size.height*0.20,
                            child: LiveGrid(
                                padding: EdgeInsets.all(5),
                                showItemInterval: Duration(milliseconds: 500),
                                showItemDuration: Duration(milliseconds: 50),
                                visibleFraction: 0.001,
                                itemCount: 2,
                                scrollDirection:Axis.vertical,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 40,
                                  mainAxisSpacing: 0,
                                ),
                                itemBuilder: animationItemBuilder(
                                        (index) => Container(
                                      child: Image.asset('assets/home/cardbg.png'),
                                    )
                                )),
                          );
                        }
                    ),
                  ),
                  Container()
                ],
              ),
              // Positioned(
              //   top: MediaQuery.of(context).size.height*0.02,
              //   left: MediaQuery.of(context).size.width*0.543,
              //   child: Image.asset("assets/dragon/cardback.png",height: 70,width: 70,),
              // ),
             Positioned(
                 top: MediaQuery.of(context).size.height*0.36,
                 left: MediaQuery.of(context).size.width*0.16,
                 child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 InkWell(
                   onTap: (){
                     soundcoin();
                     Betregistereddragon("1");

                   },
                   child: Padding(
                     padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width*0.03),
                     child: Container(
                       height: MediaQuery.of(context).size.height*0.35,
                       width: MediaQuery.of(context).size.width*0.22,
                       child: GridView.builder(
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 5,
                             //childAspectRatio: 0.90,
                           ),
                           scrollDirection: Axis.horizontal,
                           itemCount: dragon.length,
                           itemBuilder: (BuildContext context, int index) {
                             return CircleAvatar(
                               radius: 5,
                               child: Image.asset(dragon[index]),
                             );
                           }),
                     ),
                   ),
                 ),
                 InkWell(
                   onTap: (){
                     soundcoin();
                     Betregistereddragon("3");

                   },
                   child: Container(

                     height: MediaQuery.of(context).size.height*0.35,
                     width: MediaQuery.of(context).size.width*0.17,
                     child: GridView.builder(
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 5,
                           //childAspectRatio: 0.90,
                         ),
                         scrollDirection: Axis.horizontal,
                         itemCount: tie.length,
                         itemBuilder: (BuildContext context, int index) {
                           return CircleAvatar(
                             radius: 5,
                             child: Image.asset(tie[index]),
                           );
                         }),
                   ),
                 ),
                 InkWell(
                   onTap: (){
                     soundcoin();
                     Betregistereddragon("2");

                   },
                   child: Padding(
                     padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.04),
                     child: Container(
                       height: MediaQuery.of(context).size.height*0.35,
                       width: MediaQuery.of(context).size.width*0.19,
                       child: GridView.builder(
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 5,
                             //childAspectRatio: 0.90,
                           ),
                           scrollDirection: Axis.horizontal,
                           itemCount: tiger.length,
                           itemBuilder: (BuildContext context, int index) {
                             return CircleAvatar(
                               radius: 5,
                               child: Image.asset(tiger[index]),
                             );
                           }),
                     ),
                   ),
                 ),
               ],
             )
             ),


              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Center(
                    child: Container(
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
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }

  soundcard()async{
    final prefs = await SharedPreferences.getInstance();
    final soundsl= await prefs.getBool('sounds')??false;
    soundsl ==false?print('ok'):
    await _player.play('audio/coin.mp3');
  }
  var res5='0';
  var res1='0';
  var res2='0';
  var res3='0';
  var res4='0';
  var score='0';
  Future<List<Albbb>> boweeee() async{
    final response = await http.get(
      Uri.parse("https://casino.foundercodes.com/index.php/Mobile_app/demo?gameid=5"),
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

  List dragon = [];
  List tie = [];
  List tiger = [];
  Betregistereddragon(String btm)async {

    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";


    final response = await http.post(
      Uri.parse(
          Apiconstant.baseurl + "bet"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "user_id":"$value",
        "gamesno":"1",
        "amount":batam,
        "gameid":"5",
        "betno":btm,
      }),
    );

    print("ayyyy");
    final data = jsonDecode(response.body);
    print(data);
    if (data['error'] == "200") {
      if(btm=='1'){
        dragon.add(batimg);

      }
      if(btm =='3'){
        tie.add(batimg);

      }
      if(btm =='2'){
        tiger.add(batimg);

      }
      // final otp=data['otp'];
      // final prefs1 = await SharedPreferences.getInstance();
      // final key1 = 'user_id';
      // final mobile = data['data']['id'] ;
      // prefs1.setString(key1, mobile);
   print("aryaman");
    } else {
      Fluttertoast.showToast(
          msg: data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      // signup();
      print("Bet not registerd");
    }
  }
  Future<List<Alb>> bowe() async{
    final response = await http.get(
      Uri.parse(Apiconstant.baseurl+'allcards'),
    );
    final jsond = json.decode(response.body)["country"];
    List<Alb> allround = [];
    for (var o in jsond)  {
      Alb al = Alb(
        o["image"],

      );

      allround.add(al);
    }
    return allround;
  }
}
class Alb {
  String? image;
  Alb(this.image,
      );
}
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