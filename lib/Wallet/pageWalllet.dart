import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualcasino/constant/apihelper.dart';


class pagewallet extends StatefulWidget {
  const pagewallet({Key? key}) : super(key: key);

  @override
  State<pagewallet> createState() => _pagewalletState();
}

class _pagewalletState extends State<pagewallet> {

  @override
  void initState() {
    wallet();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/home/wallet.png'),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.only(top:2,bottom: 2,left: 15),
            child:  Container(
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,

                  radius: 20,
                  backgroundImage:photo!=null? NetworkImage("https://casino.foundercodes.com/uploads/"+photo.toString()):
                  NetworkImage("https://cdn-icons-png.flaticon.com/512/149/149071.png"),
                  child:
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 30,
                      backgroundImage:AssetImage('assets/home/userprofile.png')
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 11,),
          Text(amount.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
            fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,
          ),
          ),
          ),
        ],
      ),
    );
  }
  var amount='0';
  var name='Your Name';
  var photo;
  var number='123546781';
  wallet() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";

    final response = await http.get(
      Uri.parse(Apiconstant.baseurl + 'profile_get?user_id=$value'),
    );

    final jsond = json.decode(response.body)["data"];
    setState(() {
      var fda=jsond[0];
      amount=fda["wallet"];
      name= fda["full_name"];
      photo= fda["photo"];
      number=fda["mobile"];
    });
    print(jsond);

  }
}
