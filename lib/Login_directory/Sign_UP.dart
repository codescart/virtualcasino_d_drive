import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualcasino/HomeDirectory/NewHome.dart';
import 'package:http/http.dart' as http;
import 'package:virtualcasino/Login_directory/Otp.dart';
import 'package:virtualcasino/Login_directory/SSighnup.dart';
import 'package:virtualcasino/constant/apihelper.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

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

          Center(
            child: Container(

              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/home/layer_bg.png",)
                  )
              ),
              width: 400,
              padding: const EdgeInsets.only(left: 5.0, right: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60,),
                  Center(
                    child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/home/buttonappbarbg.png",)
                            )
                        ),
                        width: 200,
                        padding: const EdgeInsets.only(left: 5.0, right: 15.0),
                        child:TextFormField(
                          controller: phoneController,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          textAlignVertical: TextAlignVertical.bottom,
                          style: const TextStyle(color: Colors.white),
                          cursorColor: const Color(0xFF075E54),
                          decoration: InputDecoration(
                            counterText: "",
                            contentPadding: const EdgeInsets.only(bottom: 13.0),
                            prefixIcon: Container(
                                margin: const EdgeInsets.only(right: 8),

                                child: const Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text(
                                    "+91",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                )),

                            border: InputBorder.none,
                            hintText: 'Mobile Number',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 15,
                            ),
                          ),
                        ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  InkWell(
                    onTap: (){
                      sound();
                      login(phoneController.text);
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
                            child: Text('Get Otp',
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
          )
        ],

      ),
    );
  }
  login(String mobile)async {
    final response = await http.post(
      Uri.parse(
          Apiconstant.baseurl + "userlogin"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "mobile":mobile,
      }),
    );
    final data = jsonDecode(response.body);
    print(data);
    if (data['error'] == "200") {

      final prefs = await SharedPreferences.getInstance();
      final key = 'user_id';
      final userid = data['id']['id'] ;
      prefs.setString(key, userid);
      print("sssss");



      print("user_id Printed");
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Otp(mobile:mobile,status: "200")));

      print(" login SucessFully");
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Otp(mobile:mobile,status: "400")));

      print("not regisdterd");
    }
  }


}