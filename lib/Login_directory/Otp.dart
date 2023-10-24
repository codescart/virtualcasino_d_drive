import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualcasino/HomeDirectory/NewHome.dart';
import 'package:http/http.dart' as http;
import 'package:virtualcasino/Login_directory/SSighnup.dart';
import 'package:virtualcasino/constant/apihelper.dart';

class Otp extends StatefulWidget {
  final String mobile;
  final String status;

  Otp({super.key, required this.mobile, required this.status});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  final AudioCache _player = AudioCache();

  @override
  sound()async{
    final prefs = await SharedPreferences.getInstance();
    final soundsl= await prefs.getBool('sounds')??false;
    soundsl ==false?print('ok'):
    await _player.play('audio/click_sound.mp3');
  }
  var code = "";

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/home/loadbg.png",)
                )
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Container(

                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/home/layer_bg.png",)
                    )
                ),
                width: 400,
                padding: const EdgeInsets.only(left: 5.0, right: 15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 90,
                    ),
                    Text(
                      "Verify Phone",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text("Code is sent to "+"+91"+"${widget.mobile}",
                        style: TextStyle(color: Colors.grey),),
                    ),
                    Container(
                      height: 40,
                      child: Pinput(
                        onChanged: (value) {

                          setState(() {
                            code = value;

                          });
                        },
                        length: 4,
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                      ),
                    ),
                    SizedBox(height: 40,),
                    InkWell(
                      onTap: (){
                        print(code);
                        sound();
                        login(code);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          // borderRadius: BorderRadius.circular(5),
                          // color: Colors.green,

                        ),
                        child:Container(
                          height: 40,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/home/btn_sure.png",)
                              )
                          ),
                          width: 200,
                          child:Center(
                            child: Text('Submit',
                              style:  GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                fontSize: 18,fontWeight: FontWeight.w900,color: Colors.white,
                              ),
                              ),
                            ),
                          ),
                        ),
                      ),)

                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
  login(String code)async {
    print(code);
    if (code == '1111') {
      if (widget.status == "200") {

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NewHomePage(number: widget.mobile,)));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Sighnup(mobile: widget.mobile)));
      }
    }
  }
}