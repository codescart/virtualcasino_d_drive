import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:virtualcasino/constant/apihelper.dart';
class Add_Widraw extends StatefulWidget {
  const   Add_Widraw({Key? key}) : super(key: key);

  @override
  State<Add_Widraw> createState() => _AddacountState();
}

class _AddacountState extends State<Add_Widraw> {
  List categoryItemlist = [];
  final AudioCache _player = AudioCache();

  @override
  void initState() {
    sound();
    // TODO: implement initState
    super.initState();
    // bowe();
    state();
  }
  sound()async{
    final prefs = await SharedPreferences.getInstance();
    final soundsl= await prefs.getBool('sounds')??false;
    soundsl ==false?print('ok'):
    await _player.play('audio/click_sound.mp3');
  }
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController account_id = TextEditingController();
  TextEditingController amount = TextEditingController();
  @override
  String ? Coion ;
  List state_data = [];
  Future<String> state() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    final res = await http.get(
        Uri.parse(Apiconstant.baseurl+'account_get?user_id=$value')
    );
    final resBody = json.decode(res.body)['country'];
    print("hhhhhhhhhhhhh");
    print(resBody);
    setState(() {
      state_data = resBody;
    });
    return "Sucess";
  }
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/home/loadbg.png'),
                    fit: BoxFit.fill,
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/home/qiandao.png'),
                          fit: BoxFit.fill,
                        )
                    ),
                    // width: 340,
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(

                      children: [
                        SizedBox(height: 40,),
                        Text("Cash Out",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                            fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black
                        ),
                        ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                       width: 360,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/home/bg_rank_me.png'),
                                fit: BoxFit.fill,
                              )
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              dropdownColor: Colors.white,
                              hint: Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.account_balance,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                    SizedBox(width: 10,),
                                    Text('Select bank id',style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                        fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black
                                    ),
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              items: state_data.map((item) {
                                return DropdownMenuItem(
                                  child:  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      item['bank_name'].toString() +   item['account_no'].toString(), overflow: TextOverflow.clip,
                                      // maxLines: ,
                                      softWrap: false,
                                      style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                        fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black,
                                      ),
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  value: item['account_no'].toString(),
                                );
                              }).toList(),
                              onChanged: (value) async {
                                setState(() {
                                  Coion = value as String ;
                                }
                                );
                              },
                              value: Coion,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                            ),
                            ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/home/bg_rank_me.png'),
                                fit: BoxFit.fill,
                              )
                          ),
                          width: 375,
                          child: TextFormField(
                            controller: amount,
                            // maxLength: 2,
                            keyboardType: TextInputType.number,
                            textAlignVertical: TextAlignVertical.bottom,
                            style: const TextStyle(color: Colors.black),
                            cursorColor:  Colors.black,
                            decoration: InputDecoration(


                              // counterText: "",
                              contentPadding: const EdgeInsets.only(bottom: 13.0),
                              prefixIcon:Icon(Icons.account_balance_sharp,color: Colors.black,),
                              border: InputBorder.none,
                              hintText: 'Coins',
                              hintStyle: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                  fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black
                              ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        InkWell(
                          onTap: (){
                            sound();
                            Widraw_add( amount.text,Coion.toString(),);
                          },
                          child: Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/home/btn_sure.png'),
                                  fit: BoxFit.fill,
                                )
                            ),
                            child: Center(
                              child: Text('Widrawl',textAlign:TextAlign.justify, style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                              ),
                              ),),
                            ),
                          ),),
                      ],
                    ),
                  ),

                ],
              ),
            ),
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
          ],
        ),
        ),

    );
  }

  Widraw_add(String amount,String account_id,)async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    final response = await http.post(
      Uri.parse(
          Apiconstant.baseurl + "withdraw_add"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "amount":amount,
        "account_id":account_id,
        "user_id" : "$value",
      }),
    );
    final data = jsonDecode(response.body);
    print(data);

    if (data['error'] == "200") {
      print("Aryaman withdraw_add  SucessFully");
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> NewHomePage()));
    } else {
      // signup();
      print("not regisdterd");
    }
  }

}
class Alb {
  String id;
  String user_id;
  String account_no;
  String ifsc;
  String micr;
  String branch;
  String bank_name;
  String upi;
  String pan;
  String aadhar_card;

  Alb(this.id,
      this.user_id,
      this.account_no,
      this.ifsc,
      this.micr,
      this.branch,
      this.bank_name,
      this.upi,
      this.pan,
      this.aadhar_card,
      );

}

