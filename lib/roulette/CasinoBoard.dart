import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualcasino/constant/apihelper.dart';



class RouletteLayout extends StatefulWidget {
  final double widths;
  final double heights;


   RouletteLayout({Key? key, required this.widths, required this.heights}) : super(key: key);

  @override
  State<RouletteLayout> createState() => _RouletteLayoutState();
}

class _RouletteLayoutState extends State<RouletteLayout> {

  static const List data= <int>[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36];
  final red = {1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36};
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
    return Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: widget.heights*0.55,
                  width: widget.widths*0.25,
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: Color(0xffffd700),
                  //       width: 1,
                  //     )
                  // ),
                  child:  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 4,
                    child:
                    Text(
                      0.toString(),
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  ),
                ),
                Container(
                  height: widget.heights*0.55,
                  width: widget.widths*2.20,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){

                            Betregisteredfunroulette(data[index],'0');

                          },
                          child: Container(
                            height: widget.heights*0.20,
                            width: widget.widths*0.20,
                            // decoration: BoxDecoration(
                            //     border: Border.all(
                            //       color: Color(0xffffd700),
                            //       width: 1,
                            //     )
                            // ),
                            child: Padding(
                              padding: EdgeInsets.all(2),
                              child: Container(
                                child: CircleAvatar(
                                  backgroundColor: data[index]==1? Color(0xffb20909)
                                      :data[index]== 3? Color(0xffb20909) :data[index]== 5? Color(0xffb20909) :data[index]== 7? Color(0xffb20909) :data[index]== 9? Color(0xffb20909) :data[index]== 12? Color(0xffb20909) :data[index]== 14? Color(0xffb20909) :data[index]== 16? Color(0xffb20909) :data[index]== 18? Color(0xffb20909) :data[index]== 19? Color(0xffb20909) :data[index]== 21? Color(0xffb20909) :data[index]== 23? Color(0xffb20909) :data[index]== 25? Color(0xffb20909) :data[index]== 27? Color(0xffb20909) :data[index]== 30? Color(0xffb20909) :data[index]== 32? Color(0xffb20909) :data[index]== 34? Color(0xffb20909) :data[index]== 36? Color(0xffb20909):Colors.black,
                                  radius: 8,
                                  child:
                                  Text(data[index].toString(), style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),
                          ),
                        ) ;
                      }),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              InkWell(
                child: Container(
                  width: widget.widths*0.3,
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: Color(0xffffd700),
                  //       width: 1,
                  //     )
                  // ),
                  child: Center(child: Text('1st 12',style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                      fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                  ),
                  ),)),
                ),
              ),
              InkWell(
                child: Container(
                  width: widget.widths*0.3,
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: Color(0xffffd700),
                  //       width: 1,
                  //     )
                  // ),
                  child: Center(child: Text('2nd 12',style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                      fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                  ),
                  ),
                  )
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  width: widget.widths*0.3,
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: Color(0xffffd700),
                  //       width: 1,
                  //     )
                  // ),
                  child: Center(child: Text('3rd 12',style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                      fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                  ),
                  ),)),
                ),
              ),
              SizedBox(
                width: 130,
              ),
            ],
          ),
          SizedBox(height: 5,),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: widget.heights*0.20,
                width: widget.widths*0.35,
                child: Image.asset("assets/roulette/diamond.png",color: Colors.black,fit: BoxFit.fill,),
              ),
              SizedBox(width: 10,),
              Container(
                height: widget.heights*0.20,
                width: widget.widths*0.35,

                child: Image.asset("assets/roulette/diamond.png",color: Colors.red,fit: BoxFit.fill,),
              ),
              SizedBox(
                width: 110,
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(left: 58.0,bottom: 30),
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
                      onTap: (){
                        sound();
                        setState(() {
                          batam= batval[index].toString();
                        });
                        print(batam);
                        // Betregisteredfunroulette("Andar",batval[index].toString());
                      },
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: Container(


                          child: CircleAvatar(
                            // backgroundColor: colord[index],
                            radius: 20,
                            child: Image.asset(batvals[index].toString()),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),
          ),


        ],

    );
  }
  var batam;
  List dragon = [];

  List zero = [];
  List on2 = [];
  List tw2 = [];
  List th2 = [];
  List tiger1 = [];
  List tiger2 = [];
  Betregisteredfunroulette(int Betno,String amount,)async {
print('ppppppp');
print(batam);


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
        "amount":batam,
        "gameid":"6",
        "betno":Betno.toString(),
      }),
    );
    final data = jsonDecode(response.body);
    print(data);
    if (data['error'] == "200") {
      if(Betno >= 1 && Betno <= 36){
        dragon.add(Betno);

      }
      if(Betno =='1000'){
        tiger2.add(Betno);

      }
      if(Betno =='2000'){
        tiger2.add(Betno);

      }
print(dragon);
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

