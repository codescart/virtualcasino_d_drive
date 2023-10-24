import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualcasino/AndarBahar/home_page.dart';
import 'package:virtualcasino/FUN_casino/Fun_Home.dart';
import 'package:virtualcasino/customappbar/customappbar.dart';
import 'package:virtualcasino/dragonTiger/home.dart';
import 'package:virtualcasino/roulette/RoulleteHome.dart';
import 'package:virtualcasino/triplefun/Triple_fun_RoulleteHome.dart';



class Main_home_page extends StatefulWidget {
  const Main_home_page({Key? key}) : super(key: key);

  @override
  State<Main_home_page> createState() => _Main_home_pageState();
}

class _Main_home_pageState extends State<Main_home_page> {
  final AudioCache _player = AudioCache();
  @override
  sound()async{
    final prefs = await SharedPreferences.getInstance();
    final soundsl= await prefs.getBool('sounds')??false;
    soundsl ==false?print('ok'):
    await _player.play('audio/cl0ick_sound.mp3');
  }
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  image: AssetImage('assets/fun/Homebackground.png',),fit: BoxFit.fill,
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: InkWell(
                    onTap: (){
                      sound();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Fun_Home()));
                    },
                    child: Container(
                      height:200,
                      width: 100,

                      padding: EdgeInsets.only(left: 10, right: 10,top: 4, bottom: 4),

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffffd700),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('assets/home/1.png'),
                            fit: BoxFit.fill
                        ),

                      ),

                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          sound();
                        },
                        child: Container(
                            height:100,
                            width: 100,
                            padding: EdgeInsets.only(left: 10, right: 10,top: 4, bottom: 4),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffffd700),
                                  width: 1,
                                ),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage('assets/home/5.png'),
                                  fit: BoxFit.fill
                              ),

                            ),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          sound();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Triple_fun_RoulleteHome()));

                    },
                        child: Container(
                          height:100,
                          width: 100,

                          padding: EdgeInsets.only(left: 10, right: 10,top: 4, bottom: 4),

                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffffd700),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage('assets/home/2.png'),
                                fit: BoxFit.fill
                            ),

                          ),

                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          sound();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Dragon_Home()));
                        },
                        child: Container(
                          height:100,
                          width: 100,
                          padding: EdgeInsets.only(left: 10, right: 10,top: 4, bottom: 4),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffffd700),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage('assets/home/3.png'),
                                fit: BoxFit.fill
                            ),
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          sound();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RoulleteHome()));
                        },
                        child: Container(
                          height:100,
                          width: 100,

                          padding: EdgeInsets.only(left: 10, right: 10,top: 4, bottom: 4),

                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffffd700),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage('assets/home/4.png'),
                                fit: BoxFit.fill
                            ),

                          ),

                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}