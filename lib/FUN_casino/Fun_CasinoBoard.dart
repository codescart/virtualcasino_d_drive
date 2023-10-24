import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:virtualcasino/constant/apihelper.dart';


class ClockModel {

  late int hour;
  late int minute;
  late int second;
  late bool is24HourFormat;

  get is24HourTimeFormat => this.is24HourFormat;
}
class RouletteLayout extends StatefulWidget {
  const RouletteLayout({Key? key,}) : super(key: key);

  @override
  State<RouletteLayout> createState() => _RouletteLayoutState();
}

class _RouletteLayoutState extends State<RouletteLayout> {
  late DateTime _dateTime;
  late ClockModel _clockModel;
  late Timer _timer;
  int tom=0;

  final AudioCache _player = AudioCache();

 static const List data= <int>[0,1,2,3,4,5,6,7,8,9,];
  final red = {1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36};
 static const List batva= <String>['1','5','10','50','100','500','1000','5000'];
 static const List colord= <Color>[Color(0xff009316), Color(0xff0741d0), Color(0xff6c0303), Color(0xffd9b149), Color(0xff069a7f), Color(0xffbb1a82),
   Color(0xff9d4303), Color(0xff6581f8)
 ];
  static const List batval= <String>['1','2','5','10','20','50', '100','200','500','1000','2000','5000'];

  static const List batvals= <String>['assets/chips/1_0.png','assets/chips/2_0.png','assets/chips/5_0.png','assets/chips/10_0.png','assets/chips/20_0.png','assets/chips/50_0.png','assets/chips/100_0.png','assets/chips/200_0.png','assets/chips/500_0.png','assets/chips/1000_0.png','assets/chips/2000_0.png','assets/chips/5000_0.png'];
 @override
 void initState() {
   sound();
   // TODO: implement initState
   super.initState();



 }

 sound()async{
   final prefs = await SharedPreferences.getInstance();
   final soundsl= await prefs.getBool('sounds')??false;
   soundsl ==false?print('ok'):
   await _player.play('audio/click_sound.mp3');
 }

  var betno;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          height: 60,
          width: 620,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){

                    setState(() {
                       betno= data[index].toString();
                    });
                    sound();
                  },
                  child: Column(
                    children: [

                      Container(
                        height: 60,
                        width: 60,

                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/fun/coin.png'),
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,

                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFE8BE57),
                                radius: 10,
                                child: Text(data[index].toString(), style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ) ;
              }),

        ),
        Container(
          height: 50,
          width: 550,
          child: ListView.builder(

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
                          Betregistered(betno,batval[index].toString());

                        },
                        child: CircleAvatar(

                          radius: 20,
                          child: Image.asset(batvals[index].toString()),
                        ),
                      ),
                    ),
                  ),
                );
              }
          ),
        )


      ],
    );
  }
  Betregistered(String Betno,String amount,)async {
   print('pankaj');
   print(Betno);
   print(amount);
   print('pankaj');

   final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
   final gamesno = prefs.getString('funtragetsno') ?? "0";

    final response = await http.post(
      Uri.parse(
          Apiconstant.baseurl + "bet"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "user_id":"$value",
        "gamesno":"$gamesno",
        "amount":amount,
        "gameid":"3",
        "betno":'$Betno',
      }),
    );

    final data = jsonDecode(response.body);
    print(data);
    if (data['error'] == "200") {
      // final otp=data['otp'];
      // final prefs1 = await SharedPreferences.getInstance();
      // final key1 = 'user_id';
      // final mobile = data['data']['id'] ;
      // prefs1.setString(key1, mobile);
      Fluttertoast.showToast(
          msg: "Bet of amount " + Betno.toString() +" has done successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );

      print("Bet Done SucessFully");
    } else {
      // signup();
      Fluttertoast.showToast(
          msg: "Bet not done successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      print("Bet not registerd");
    }
  }
}

