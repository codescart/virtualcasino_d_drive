import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtualcasino/bethistory/Triplefunhistory.dart';
import 'package:virtualcasino/bethistory/bethistory.dart';
import 'package:virtualcasino/bethistory/funroulette.dart';
import 'package:virtualcasino/bethistory/funtarget.dart';

import 'andarbharhistory.dart';




class Bettab extends StatelessWidget {
  const Bettab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
       shadowColor: Colors.transparent,
       automaticallyImplyLeading: false,
          flexibleSpace:Container(
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
            ),
            child: TabBar(

              indicatorColor: Colors.yellow,
              tabs: <Widget>[
                Tab(
                  icon: Image.asset("assets/new/andarbahar.gif",height: 25, width: 25,fit: BoxFit.fill,),
                  child: Text("Dragon Tiger",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                    fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,
                  ),
                  ),),
                ),
                Tab(
                  icon: Image.asset("assets/new/andarbahar.gif",height: 25, width: 25,fit: BoxFit.fill,),
                  child: Text("Andar Bahar",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                  fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,
                ),
                ),),

                ),
                Tab(
                  icon: Image.asset("assets/new/andarbahar.gif",height: 25, width: 25,fit: BoxFit.fill,),
                  child: Text("Triple Fun",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                  fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,
                ),
                ),),

                ),
                Tab(
                  icon: Image.asset("assets/new/andarbahar.gif",height: 25, width: 25,fit: BoxFit.fill,),
                  child: Text("Fun Roulette",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                  fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,
                ),
                ),),
                ),
                Tab(
                  icon: Image.asset("assets/new/andarbahar.gif",height: 25, width: 25,fit: BoxFit.fill,),
                  child: Text("Fun Target",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                  fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,
                ),
                ),),
                ),

              ],
            ),
          ) ,

        ),
        body:  TabBarView(
          children: <Widget>[
            BetHistory(),
            Andarbhar(),
            Triplefunhistory(),
            Funroulette(),
            Funtarget(),
          ],
        ),
      ),
    );
  }
}
