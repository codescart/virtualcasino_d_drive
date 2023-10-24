
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualcasino/constant/apihelper.dart';


class funtargetplay extends StatefulWidget {
  const funtargetplay({Key? key}) : super(key: key);
  @override
  State<funtargetplay> createState() => _homeState();
}
class _homeState extends State<funtargetplay> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Alb>>(
                future: bowe(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context,int index)=>
                          Container(
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xffea0909),
                                  Color(0xffcc0707),
                                  Color(0xff8d0303),
                                  Color(0xff570000),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 25.0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left:5,right: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5,),
                                  Padding(
                                    padding: const EdgeInsets.only(left:8,right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Text("Game Name" ,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                          fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                        ),
                                        ),),
                                        Text("Description",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                          fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                        ),
                                        ),),
                                        Text("Rules",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                          fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                        ),
                                        ),),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.white,thickness: 1.5,),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(snapshot.data![index].gamename,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                          fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                        ),
                                        ),),
                                        Text(snapshot.data![index].description,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                          fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                        ),
                                        ),),
                                        Text(snapshot.data![index].rules,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                          fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                        ),
                                        ),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                  ) :Center(child:CircularProgressIndicator(color: Colors.red,));
                }
            ),
          ),
        ],
      ),
    );
  }
  Future<List<Alb>> bowe() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    final response = await http.get(
      Uri.parse(Apiconstant.baseurl+'howtoplay?game_id=3'),
    );
    var jsond = json.decode(response.body)["data"];

    List<Alb> allround = [];
    for (var o in jsond)  {
      Alb al = Alb(
        o["id"],
        o["gameid"],
        o["gamename"],
        o["description"],
        o["rules"],
      );
      allround.add(al);
    }
    return allround;
  }
}
class Alb {
  String id;
  String gameid;
  String gamename;
  String description;
  String rules;

  Alb(this.id,
      this.gameid,
      this.gamename,
      this.description,
      this.rules,
      );

}