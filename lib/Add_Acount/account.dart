import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:virtualcasino/constant/apihelper.dart';
class Addacount extends StatefulWidget {
  const Addacount({Key? key}) : super(key: key);

  @override
  State<Addacount> createState() => _AddacountState();
}

class _AddacountState extends State<Addacount> {
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
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController upi = TextEditingController();
  TextEditingController accountno = TextEditingController();
  TextEditingController pan = TextEditingController();
  TextEditingController aadharcard = TextEditingController();
  TextEditingController ifsc = TextEditingController();
  TextEditingController micr = TextEditingController();
  TextEditingController bankname = TextEditingController();
  TextEditingController branch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      height: MediaQuery.of(context).size.height * 0.80,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/home/qiandao.png'),
                            fit: BoxFit.fill,
                          )
                      ),
                      // width: 340,
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child:   Column(
                        children: [
                          SizedBox(height: 50,),
                          Text("Bank Detail",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                          ),
                          ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.40,
                            width: MediaQuery.of(context).size.width * 0.5,
                            // width: 340,
                            padding: const EdgeInsets.only(left: 5.0, right: 15.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/home/buttonappbarbg.png'),
                                          fit: BoxFit.fill,
                                        )
                                    ),
                                    child: TextFormField(
                                      controller: upi,
                                      keyboardType: TextInputType.name,
                                      textAlignVertical: TextAlignVertical.bottom,
                                      style: const TextStyle(color: Colors.white),
                                      cursorColor: const Color(0xFF075E54),
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(bottom: 13.0),
                                        prefixIcon: Icon(Icons.person,color: Colors.white,),
                                        border: InputBorder.none,
                                        hintText: 'UPI',
                                        hintStyle: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                            fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                                        ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/home/buttonappbarbg.png'),
                                          fit: BoxFit.fill,
                                        )
                                    ),
                                    child: TextFormField(
                                      controller: accountno,
                                      // maxLength: 2,
                                      keyboardType: TextInputType.number,
                                      textAlignVertical: TextAlignVertical.bottom,
                                      style: const TextStyle(color: Colors.white),
                                      cursorColor: const Color(0xFF075E54),
                                      decoration: InputDecoration(
                                        // counterText: "",
                                        contentPadding: const EdgeInsets.only(bottom: 13.0),
                                        prefixIcon:Icon(Icons.account_balance_sharp,color: Colors.white,),
                                        border: InputBorder.none,
                                        hintText: 'Account no.',
                                        hintStyle: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                            fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                                        ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/home/buttonappbarbg.png'),
                                          fit: BoxFit.fill,
                                        )
                                    ),
                                    child: TextFormField(
                                      controller: pan,
                                      // maxLength: 2,
                                      keyboardType: TextInputType.name,
                                      textAlignVertical: TextAlignVertical.bottom,
                                      style: const TextStyle(color: Colors.white),
                                      cursorColor: const Color(0xFF075E54),
                                      decoration: InputDecoration(
                                        counterText: "",
                                        contentPadding: const EdgeInsets.only(bottom: 13.0),
                                        prefixIcon:Icon(Icons.credit_card,color: Colors.white,),
                                        border: InputBorder.none,
                                        hintText: 'Pan Card.',
                                        hintStyle: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                            fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                                        ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/home/buttonappbarbg.png'),
                                          fit: BoxFit.fill,
                                        )
                                    ),
                                    child: TextFormField(
                                      controller: aadharcard,
                                      keyboardType: TextInputType.number,
                                      textAlignVertical: TextAlignVertical.bottom,
                                      style: const TextStyle(color: Colors.white),
                                      cursorColor: const Color(0xFF075E54),
                                      decoration: InputDecoration(
                                        counterText: "",
                                        contentPadding: const EdgeInsets.only(bottom: 13.0),
                                        prefixIcon:Icon(Icons.height,color: Colors.white,),
                                        border: InputBorder.none,
                                        hintText: 'Age.',
                                        hintStyle: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                            fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                                        ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/home/buttonappbarbg.png'),
                                          fit: BoxFit.fill,
                                        )
                                    ),
                                    child: TextFormField(
                                      controller: ifsc,
                                      keyboardType: TextInputType.number,
                                      textAlignVertical: TextAlignVertical.bottom,
                                      style: const TextStyle(color: Colors.white),
                                      cursorColor: const Color(0xFF075E54),
                                      decoration: InputDecoration(
                                        counterText: "",
                                        contentPadding: const EdgeInsets.only(bottom: 13.0),
                                        prefixIcon:Icon(Icons.password,color: Colors.white,),
                                        border: InputBorder.none,
                                        hintText: 'IFSC',
                                        hintStyle: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                            fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                                        ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/home/buttonappbarbg.png'),
                                          fit: BoxFit.fill,
                                        )
                                    ),
                                    child: TextFormField(
                                      controller: micr,
                                      keyboardType: TextInputType.name,
                                      textAlignVertical: TextAlignVertical.bottom,
                                      style: const TextStyle(color: Colors.white),
                                      cursorColor: const Color(0xFF075E54),
                                      decoration: InputDecoration(
                                        counterText: "",
                                        contentPadding: const EdgeInsets.only(bottom: 13.0),
                                        prefixIcon:Icon(Icons.people,color: Colors.white,),
                                        border: InputBorder.none,
                                        hintText: 'Micr',
                                        hintStyle: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                            fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                                        ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/home/buttonappbarbg.png'),
                                          fit: BoxFit.fill,
                                        )
                                    ),
                                    child: TextFormField(
                                      controller: bankname,
                                      keyboardType: TextInputType.name,
                                      textAlignVertical: TextAlignVertical.bottom,
                                      style: const TextStyle(color: Colors.white),
                                      cursorColor: const Color(0xFF075E54),
                                      decoration: InputDecoration(
                                        counterText: "",
                                        contentPadding: const EdgeInsets.only(bottom: 13.0),
                                        prefixIcon:Icon(Icons.account_balance,color: Colors.white,),
                                        border: InputBorder.none,
                                        hintText: 'Bank Name',
                                        hintStyle: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                            fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                                        ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                  image: DecorationImage(
                                  image: AssetImage('assets/home/buttonappbarbg.png'),
                              fit: BoxFit.fill,
                            )
                          ),
                                    child: TextFormField(
                                      controller: branch,
                                      keyboardType: TextInputType.name,
                                      textAlignVertical: TextAlignVertical.bottom,
                                      style: const TextStyle(color: Colors.white),
                                      cursorColor: const Color(0xFF075E54),
                                      decoration: InputDecoration(
                                        counterText: "",
                                        contentPadding: const EdgeInsets.only(bottom: 13.0),
                                        prefixIcon:Icon(Icons.pin_drop,color: Colors.white,),
                                        border: InputBorder.none,
                                        hintText: 'Branch',
                                        hintStyle: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                            fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                                        ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30,),
                                  InkWell(onTap: (){
                                    sound();
                                    AddAccount(upi.text, accountno.text, pan.text,aadharcard.text,ifsc.text,micr.text,bankname.text,branch.text);
                                  }, child: Container(
                                    height: 35,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/home/btn_sort_1_.png'),
                                          fit: BoxFit.fill,
                                        )
                                    ),
                                    child: Center(
                                      child: Text('Add Account',style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                      ),
                                      ),),
                                    ),
                                  ),),
                                  SizedBox(height: 10,),

                                ],
                              ),
                            ),
                          ),

                        ],
                      )
                    ),

                  ],
                ),
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

  AddAccount(String upi,String account_no,String pan,String aadhar_card,String ifsc,String micr,String bank_name,String branch,)async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    final response = await http.post(
      Uri.parse(
          Apiconstant.baseurl + "add_account"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "upi":upi,
        "account_no":account_no,
        "pan":pan,
        "aadhar_card":aadhar_card,
        "ifsc":ifsc,
        "micr":micr,
        "bank_name":bank_name,
        "branch":branch,
        "user_id" : "$value",
      }),
    );
    final data = jsonDecode(response.body);
    print(data);
    if (data['error'] == "200") {
      print("Aryaman Addacount SucessFully");
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> NewHomePage()));
    } else {
      // signup();
      print("not regisdterd");
    }
  }

}

