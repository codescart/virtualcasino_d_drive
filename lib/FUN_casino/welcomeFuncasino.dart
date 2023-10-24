import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:virtualcasino/FUN_casino/Fun_Home.dart';

import 'package:virtualcasino/HomeDirectory/GameDesign.dart';
import 'package:virtualcasino/constant/apihelper.dart';
import 'package:virtualcasino/triplefun/Triple_fun_RoulleteHome.dart';

class welcomeFun extends StatefulWidget {
  const welcomeFun({Key? key}) : super(key: key);


  @override
  State<welcomeFun> createState() => _welcomeFunState();
}


class _welcomeFunState extends State<welcomeFun> {
  double percent = 0.0;
  final AudioCache _player = AudioCache();

  void initState() {
    super.initState();
    sound();
    Timer(Duration(seconds: 10),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => Fun_Home()
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
    await _player.play('audio/funcasino.mp3');
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: CachedNetworkImage(
          imageUrl: "http://via.placeholder.com/200x150",
          imageBuilder: (context, imageProvider) =>  Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  image: imageProvider,
                  //CachedNetworkImageProvider(Apiconstant.gifurl+"home.gif"),fit: BoxFit.fill,
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GameDesign(gamename: 'Fun Target', gamegif: 'assets/new/rolete2.gif',),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
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
                            color: Colors.black),
                      ),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Colors.blue[400],
                      backgroundColor: Colors.grey[300],
                    ),
                  ),
                ),

              ],
            ),
          ),
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        )
    );
  }
}
