
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualcasino/constant/apihelper.dart';


class BetHistory extends StatefulWidget {
  const BetHistory({Key? key}) : super(key: key);
  @override
  State<BetHistory> createState() => _homeState();
}
class _homeState extends State<BetHistory> {

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
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [ SizedBox(height: 10,),

                                 Text("Bet" ,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                   fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                 ),
                                 ),),
                                 Text("Gamesno",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                   fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                 ),
                                 ),),
                                 Text("Amount",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                   fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                 ),
                                 ),),
                                 Text("GameType" ,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                   fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                 ),
                                 ),),
                                 Text("Total Win" ,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                   fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                 ),
                                 ),),
                                 Text("Gamen" ,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                   fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                 ),
                                 ),),
                                 Text("Date & Time" ,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                   fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                 ),
                                 ),),
                               ],
                             ),
                              Divider(color: Colors.white,thickness: 1.5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data![index].bet,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                  ),
                                  ),),
                                  Text(snapshot.data![index].gamesno,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                  ),
                                  ),),
                                  Text(snapshot.data![index].amount,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                  ),
                                  ),),
                                  Text(snapshot.data![index].gametype,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                  ),
                                  ),),
                                  Text(snapshot.data![index].winstatus,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                  ),
                                  ),),
                                  Text(snapshot.data![index].gameno,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                  ),
                                  ),),
                                  Text(snapshot.data![index].datetime,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                  ),
                                  ),),
                                ],
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
      Uri.parse(Apiconstant.baseurl+'bet_history?user_id=$value&gameid=5'),
    );
    var jsond = json.decode(response.body)["data"];

    List<Alb> allround = [];
    for (var o in jsond)  {
      Alb al = Alb(
        o["id"],
        o["user_id"],
        o["bet"],
        o["amount"],
        o["gametype"],
        o["gameno"],
        o["gamesno"],
        o["winstatus"],
        o["status"],
        o["datetime"],
      );
      allround.add(al);
    }
    return allround;
  }
}
class Alb {
  String id;
  String user_id;
  String bet;
  String amount;
  String gametype;
  String gameno;
  String gamesno;
  String winstatus;
  String status;
  String datetime;


  Alb(this.id,
      this.user_id,
      this.bet,
      this.amount,
      this.gametype,
      this.gameno,
      this.gamesno,
      this.winstatus,
      this.status,
      this.datetime);

}