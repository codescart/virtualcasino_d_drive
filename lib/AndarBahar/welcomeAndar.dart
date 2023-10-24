import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualcasino/AndarBahar/home_page.dart';
import 'package:virtualcasino/HomeDirectory/GameDesign.dart';
import 'package:virtualcasino/constant/apihelper.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class welcometiger extends StatefulWidget {
  const welcometiger({Key? key}) : super(key: key);


  @override
  State<welcometiger> createState() => _welcometigerState();
}


class _welcometigerState extends State<welcometiger> {
  double percent = 0.0;
  final AudioCache _player = AudioCache();

  void initState() {
    super.initState();
    sound();
    Timer(Duration(seconds: 10),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => HOME_PAGE()
            )
        )
    );
    Timer ?timer;
    timer = Timer.periodic(Duration(milliseconds:450),(_){

      setState(() {
        percent+=5;
        if(percent >= 100){
          timer!.cancel();
          // percent=0;
        }
      });
    });
  }
  sound() async{
    final prefs = await SharedPreferences.getInstance();
    final soundsl= await prefs.getBool('sounds')??false;
    soundsl ==false?print('ok'):
    await _player.play('audio/andarbahar.mp3');
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: CachedNetworkImage(
          imageUrl: Apiconstant.gifurl+"home.png",
          imageBuilder: (context, imageProvider) => Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: imageProvider
                  // image: CachedNetworkImageProvider(Apiconstant.gifurl+"home.gif"),fit: BoxFit.fill,
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 120,
                    width: 180,
                    child: Image.asset('assets/home/andarbaharicon.png',

                    )),
                SizedBox(height: 40,),

                Stack(
                  clipBehavior: Clip.none,
                  children: [
                   Positioned(
                     bottom: -15,
                     left: -12,
                     child: Container(

                  height:50 ,
                  width: 225,

                  decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/home/loading_bg.png'),
                          fit: BoxFit.fill,
                        )
                  )),
                   ),
                    Container(
                      height: 20,
                      width: 200,
                      child: LinearPercentIndicator( //leaner progress bar
                        animation: true,
                        animationDuration: 1000,
                        lineHeight: 20.0,
                        percent:percent/100,
                        center: Text(
                          percent.toString() + "%",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        linearStrokeCap: LinearStrokeCap.round,
                        progressColor: Colors.blue[400],
                        backgroundColor: Color(0xff4b1b0d),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          placeholder: (context, url) => Image.asset("assets/girls/casinobed.jpg",height: double.infinity,width: double.infinity,fit: BoxFit.fill,),
          errorWidget: (context, url, error) => Icon(Icons.error),
        )
    );
  }
}
