
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualcasino/constant/apihelper.dart';
import 'package:http/http.dart' as http;

// class ClockModel {
//
//   late int hour;
//   late int minute;
//   late int second;
//   late bool is24HourFormat;
//
//   get is24HourTimeFormat => this.is24HourFormat;
// }
class GridData extends StatefulWidget {
  final String nums;
   GridData({Key? key, required this.nums,}) : super(key: key);

  @override
  State<GridData> createState() => _GridDataState();
}

class _GridDataState extends State<GridData> {
  // late DateTime _dateTime;
  // late ClockModel _clockModel;
  // late Timer _timer;
  // int tom=0;



  static const List data= <String>["00","01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99"];
  static const List batval= <String>['1','5','10','50','100','500','1000','5000'];
  static const List colord= <Color>[Color(0xff009316), Color(0xff0741d0), Color(0xff6c0303), Color(0xffd9b149), Color(0xff069a7f), Color(0xffbb1a82),
    Color(0xff9d4303), Color(0xff6581f8)
  ];
  static const List batvalt= <String>['1','2','5','10','20','50', '100','200','500','1000','2000','5000'];

  static const List batvals= <String>['assets/chips/1_0.png','assets/chips/2_0.png','assets/chips/5_0.png','assets/chips/10_0.png','assets/chips/20_0.png','assets/chips/50_0.png','assets/chips/100_0.png','assets/chips/200_0.png','assets/chips/500_0.png','assets/chips/1000_0.png','assets/chips/2000_0.png','assets/chips/5000_0.png'];

  final AudioCache _player = AudioCache();

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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      // height: MediaQuery.of(context).size.height*0.325,
      // width: MediaQuery.of(context).size.width*0.73,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10,
            //childAspectRatio: 0.90,
          ),
          // scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                sound();
                showDialog(
                    context: context,
                    builder: (ctx) =>
                        AlertDialog(
                          backgroundColor: Colors.transparent,
                          content: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.52,
                                width: MediaQuery.of(context).size.width,
                                // height: MediaQuery.of(context).size.height*0.325,
                                // width: MediaQuery.of(context).size.width*0.73,
                                child: Center(
                                  child: GridView.builder(
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 10,
                                        childAspectRatio: 0.45,
                                      ),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: data.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return InkWell(

                                          child: Container(
                                            decoration: BoxDecoration(
                                              // border: Border.all(
                                              //   color: Color(0xffffd700),
                                              //   width: 1,
                                              // )
                                            ),
                                            child: Container(
                                              color:data[index]=="01" ? Colors.black:data[index]=="03" ? Colors.black:data[index]=="05" ? Colors.black:data[index]=="07" ? Colors.black:data[index]=="09" ? Colors.black:data[index]=="10" ? Colors.black:data[index]=="12" ? Colors.black:data[index]=="14" ? Colors.black:data[index]=="16" ? Colors.black:data[index]=="18" ? Colors.black:data[index]=="21" ? Colors.black:data[index]=="23" ? Colors.black:data[index]=="25" ? Colors.black:data[index]=="27" ? Colors.black:data[index]=="29" ? Colors.black:data[index]=="30" ? Colors.black:data[index]=="32" ? Colors.black:data[index]=="34" ? Colors.black:data[index]=="36" ? Colors.black:data[index]=="38" ? Colors.black:data[index]=="41" ? Colors.black:data[index]=="43" ? Colors.black:data[index]=="45" ? Colors.black:data[index]=="47" ? Colors.black:data[index]=="49" ? Colors.black:data[index]=="50" ? Colors.black:data[index]=="52" ? Colors.black:data[index]=="54" ? Colors.black:data[index]=="56" ? Colors.black:data[index]=="58" ? Colors.black:data[index]=="61" ? Colors.black:data[index]=="63" ? Colors.black:data[index]=="65" ? Colors.black:data[index]=="67" ? Colors.black:data[index]=="69" ? Colors.black:data[index]=="70" ? Colors.black:data[index]=="72" ? Colors.black:data[index]=="74" ? Colors.black:data[index]=="76" ? Colors.black:data[index]=="78" ? Colors.black:data[index]=="81" ? Colors.black:data[index]=="83" ? Colors.black:data[index]=="85" ? Colors.black:data[index]=="87" ? Colors.black:data[index]=="89" ? Colors.black:data[index]=="90" ? Colors.black:data[index]=="92" ? Colors.black:data[index]=="94" ? Colors.black:data[index]=="96" ? Colors.black:data[index]=="98"? Colors.black:
                                              Color(0xfff87a11),
                                              child: Center(child: Text(widget.nums+data[index].toString(),style: TextStyle(color: Colors.white,fontSize: 8), )),
                                            ),
                                          ),
                                        ) ;
                                      }),
                                ),
                              ),
                              Center(
                                child: Container(
                                  height: 50,
                                  width: 500,
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
                                                  // BetregisteredTriplefun(betno,widget.nums+batvalt[index].toString();
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
                          )
                        )
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Color(0xffffd700),
                  //   width: 1,
                  // )
                ),
                child: Container(
                  color:data[index]=="01" ? Colors.black:data[index]=="03" ? Colors.black:data[index]=="05" ? Colors.black:data[index]=="07" ? Colors.black:data[index]=="09" ? Colors.black:data[index]=="10" ? Colors.black:data[index]=="12" ? Colors.black:data[index]=="14" ? Colors.black:data[index]=="16" ? Colors.black:data[index]=="18" ? Colors.black:data[index]=="21" ? Colors.black:data[index]=="23" ? Colors.black:data[index]=="25" ? Colors.black:data[index]=="27" ? Colors.black:data[index]=="29" ? Colors.black:data[index]=="30" ? Colors.black:data[index]=="32" ? Colors.black:data[index]=="34" ? Colors.black:data[index]=="36" ? Colors.black:data[index]=="38" ? Colors.black:data[index]=="41" ? Colors.black:data[index]=="43" ? Colors.black:data[index]=="45" ? Colors.black:data[index]=="47" ? Colors.black:data[index]=="49" ? Colors.black:data[index]=="50" ? Colors.black:data[index]=="52" ? Colors.black:data[index]=="54" ? Colors.black:data[index]=="56" ? Colors.black:data[index]=="58" ? Colors.black:data[index]=="61" ? Colors.black:data[index]=="63" ? Colors.black:data[index]=="65" ? Colors.black:data[index]=="67" ? Colors.black:data[index]=="69" ? Colors.black:data[index]=="70" ? Colors.black:data[index]=="72" ? Colors.black:data[index]=="74" ? Colors.black:data[index]=="76" ? Colors.black:data[index]=="78" ? Colors.black:data[index]=="81" ? Colors.black:data[index]=="83" ? Colors.black:data[index]=="85" ? Colors.black:data[index]=="87" ? Colors.black:data[index]=="89" ? Colors.black:data[index]=="90" ? Colors.black:data[index]=="92" ? Colors.black:data[index]=="94" ? Colors.black:data[index]=="96" ? Colors.black:data[index]=="98"? Colors.black:
                  Color(0xfff87a11),
                  child: Center(child: Text(widget.nums+data[index].toString(),style: TextStyle(color: Colors.white,fontSize: 8), )),
                ),
              ),
            ) ;
          }),
    );
  }
  BetregisteredTriplefun(String Betno,String amount,)async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";

    // final gamesno = prefs.getString('funtragetsno') ?? "0";


    final response = await http.post(
      Uri.parse(
          Apiconstant.baseurl + "bet"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "user_id":"$value",
        "gamesno":"1",
        "amount":amount,
        "gameid":"1",
        "betno":Betno,
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
          msg: "Bet on Beton " + Betno +" has done successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );

      print("BetAnadrbhar Done SucessFully");
    } else {
      Fluttertoast.showToast(
          msg: "Bet not done successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      // signup();
      print("Bet not registerd");
    }
  }
}
