import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualcasino/HomeDirectory/NewHome.dart';
import 'package:http/http.dart' as http;
import 'package:virtualcasino/constant/apihelper.dart';

class Sighnup extends StatefulWidget {
  final String mobile;
   Sighnup({super.key, required this.mobile});

  @override
  State<Sighnup> createState() => _LoginState();
}

class _LoginState extends State<Sighnup> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController ref = TextEditingController();
  TextEditingController age = TextEditingController();
  final AudioCache _player = AudioCache();

  sound()async{
    final prefs = await SharedPreferences.getInstance();
    final soundsl= await prefs.getBool('sounds')??false;
    soundsl ==false?print('ok'):
    await _player.play('audio/click_sound.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(

              image: DecorationImage(
                  fit: BoxFit.fill,

                  image: AssetImage("assets/home/loadbg.png",)
              ),),
        child:
        Center(
          child: SingleChildScrollView(
            child: Container(
              height: 400,

              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/home/signupbg.png",)
                  )
              ),
              width: 600,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/home/bg_rank_01.png",)
                        )
                    ),
                    child: TextFormField(
                      controller: name,
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      style: const TextStyle(color: Colors.black),
                      cursorColor: const Color(0xFF075E54),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(bottom: 13.0),
                        prefixIcon: Icon(Icons.person,color: Colors.black,),
                        border: InputBorder.none,
                        hintText: 'Full Name',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/home/bg_rank_02.png",)
                        )
                    ),

                    child: TextFormField(
                      controller: ref,
                      // maxLength: 2,
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      style: const TextStyle(color: Colors.black),
                      cursorColor: const Color(0xFF075E54),
                      decoration: InputDecoration(
                        // counterText: "",
                        contentPadding: const EdgeInsets.only(bottom: 13.0),
                        prefixIcon:Icon(Icons.remove_from_queue_outlined,color: Colors.black,),

                        border: InputBorder.none,
                        hintText: 'Referrel no',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/home/bg_rank_03.png",)
                        )
                    ),
                    child: TextFormField(
                      controller: age,
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      textAlignVertical: TextAlignVertical.bottom,
                      style: const TextStyle(color: Colors.black),
                      cursorColor: const Color(0xFF075E54),
                      decoration: InputDecoration(
                        counterText: "",
                        contentPadding: const EdgeInsets.only(bottom: 13.0),
                        prefixIcon:Icon(Icons.people,color: Colors.black,),
                        border: InputBorder.none,
                        hintText: 'Age',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  InkWell(
                    onTap: (){
                      sound();
                      signup(name.text, ref.text, age.text);
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
                                image: AssetImage("assets/home/btn_cancel.png",)
                            )
                        ),
                        width: 200,
                        child:Center(
                          child: Text('Sign up',
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
        ),
      )
    );
  }
  signup(String name,String refid_code,String age)async {
    final response = await http.post(
      Uri.parse(
          Apiconstant.baseurl + "regii"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "mobile":widget.mobile,
        "name":name,
        "refid_code":refid_code,
        "age":age
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

      print(" login SucessFully");
      Navigator.push(context, MaterialPageRoute(builder: (context)=> NewHomePage(number: widget.mobile,)));
    } else {
      // signup();
      print("not regisdterd");
    }
  }


}