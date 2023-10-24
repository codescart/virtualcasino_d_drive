import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualcasino/HomeDirectory/NewHome.dart';
import 'package:virtualcasino/HomeDirectory/addcash%20page.dart';
import 'package:virtualcasino/bethistory/bettab.dart';
import 'package:virtualcasino/how_to_play/howtoplay.dart';
import 'package:virtualcasino/profile/viewprofile.dart';
import 'package:virtualcasino/shimmerWidigt/shimmer.dart';
import 'package:virtualcasino/wallethistory/Addaccount.dart';
import 'package:virtualcasino/wallethistory/wallethistory.dart';

import '../Wallet/amountwallet.dart';
import '../bethistory/bethistory.dart';
import '../constant/apihelper.dart';
import '../profile/profile_update.dart';
import 'package:http/http.dart' as http;


class CustomAppBarTwo extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBarTwo({Key? key})
      : preferredSize = const Size.fromHeight(45.0),
        super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomAppBarTwoState createState() => _CustomAppBarTwoState();
}

class _CustomAppBarTwoState extends State<CustomAppBarTwo> {
  final AudioCache _player = AudioCache();
var soundval=false;
  var music=false;

  @override
  void initState() {
    bowe();
    notification();
    sound();
    // TODO: implement initState
    super.initState();
  }
  sound()async{
    final prefs = await SharedPreferences.getInstance();
    final soundsl= await prefs.getBool('sounds')??false;
    soundsl ==false?print('ok'):
    await _player.play('audio/click_sound.mp3')
    ;
  }
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
            image: AssetImage('assets/home/appbarbeg.png'),
            opacity: 0.8
          ),

        ),
      ) ,
      automaticallyImplyLeading: false,
      leading: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/home/userbgapp.png')
        )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            InkWell(
                onTap: (){
                  sound();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile_update()));
                },
                child: Padding(
                  padding:  EdgeInsets.only(top:2,bottom: 2),
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
                )
            ),
            SizedBox(width: 10,),
            InkWell(
              onTap: ()  async  {
                sound();
                final prefsss = await SharedPreferences.getInstance();
                final String? action = prefsss.getString('action');
                print(action);
                print("arpri");
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => ViewProfile(),
                  );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                    fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white,
                  ),
                  ),
                  ),
                  Text(number.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                    fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white,
                  ),
                  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      leadingWidth: 200,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              sound();
              // Wallethistory
              Navigator.push(context, MaterialPageRoute(builder: (context)=>amountwallet()));
            },
            child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8,right: 30),
                child: Image.asset('assets/home/coin.png',
                  height: 30,
                  width: 30,
                )
            ),
          ),


          Container(
            decoration: BoxDecoration(

                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/home/buttonappbarbg.png')
                )
            ),
            height:30,
            width: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/home/btn_refresh.png',height: 50,width: 50,),
                Text(amount.toString(),style: TextStyle(fontSize:8 ),),
               InkWell(
                 onTap: (){
                   sound();
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>addcash()));
                 },
                   child: Image.asset('assets/home/btn_plus.png',height: 50,width: 50,)),

              ],
            ),
          ),

        ],
      ),
      actions: [
        IconButton(onPressed: () async {
          sound();
          showDialog(
              context: context,
              builder: (ctx) =>
                  AlertDialog(
                    backgroundColor: Colors.transparent,
                    content:Container(
                      height: 200,
                              width: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/home/level_rules_bg.png')
                          )
                      ),

                              child: Column(
                                children: [

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Container(),
                                      InkWell(
                                        onTap: (){
                                          sound();
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          height:30,
                                          width:30,
                                          child: Image.asset("assets/home/btn_close.png"),),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                    children: [
                                      Text('Bet no : ',style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                        fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,
                                      ),
                                      ),
                                      ),
                                      Text(bet.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                        fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,
                                      ),
                                      ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 28.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,

                                      children: [
                                        Text('Discription  ',style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                          fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black,
                                        ),
                                        ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  Text(description.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                    fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black,
                                  ),
                                  ),
                                  ),

                                ],
                              )
                              // ListTile(
                              //
                              //   title: Text("Bet on - " + bet.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                              //     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                              //   ),
                              //   ),),
                              //   subtitle: Text("Description - " + description.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                              //     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                              //   ),
                              //   ),),
                              // ),
                            )
                      // },
                      // ),
                    // ),
                  ));
        }, icon:Image.asset("assets/home/btn_Notice.png",height: 70,width: 70,) ),
        IconButton(onPressed: ()async{
          sound();
          showDialog(
              context: context!,
              builder: (ctx) =>
                AlertDialog(
                  backgroundColor: Colors.transparent,
                    content: Container(
                      height: 200,
                      width: 200,
                      child: ListView(
                        children: [
                          InkWell(
                            onTap: (){
                            sound();
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>Bettab()));
                            showDialog(
                                context: context,
                                builder: (ctx) =>
                                    AlertDialog(
                                        backgroundColor: Colors.transparent,

                                        content: Container(
                                            height: MediaQuery.of(context).size.height * 0.9,
                                            width:  MediaQuery.of(context).size.width * 0.8,
                                            child: Bettab())
                                    )
                            );
                          },
                            child: Container(
                              height: 55,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.yellow,width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff570000),
                                    Color(0xff8d0303),
                                    Color(0xffcc0707),
                                    Color(0xffea0909),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 25.0,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                hoverColor: Color(0xff041fa2),
                                leading: CircleAvatar(child: Icon(Icons.handyman)),
                                title: Text('Bet History',style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                    fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                ),
                                ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                       InkWell( onTap: (){
                         sound();
                          Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (ctx) =>
                                AlertDialog(
                                   backgroundColor: Colors.transparent,
                                      content: Container(
                                          height: MediaQuery.of(context).size.height * 0.9,
                                          width:  MediaQuery.of(context).size.width * 0.8,
                                          child: howtoplay()),
                                  )
                          );
                            },
                            child: Container(
                              height: 55,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.yellow,width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff570000),
                                    Color(0xff8d0303),
                                    Color(0xffcc0707),
                                    Color(0xffea0909),
                                  ],
                                ),

                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 25.0,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                hoverColor: Color(0xff041fa2),
                                leading: CircleAvatar(child: Icon(Icons.play_circle)),
                                title: Text('How To Play',style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                    fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                ),
                                ),),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          InkWell( onTap: (){sound();
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (ctx) =>
                                  AlertDialog(
                                      backgroundColor: Colors.transparent,
                                      title: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.transparent,
                                              width: 0,
                                            ),
                                            color: Colors.white,
                                            // borderRadius: BorderRadius.all(Radius.circular(50))
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: MediaQuery.of(context).size.width * 0.5,
                                                color: Colors.yellow,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Center(
                                                      child: Text(" Term & Conditions",
                                                        style: GoogleFonts.playfairDisplay(textStyle:TextStyle(
                                                            fontSize: 22,fontWeight: FontWeight.bold,color: Colors.yellow.shade900
                                                        ),
                                                        ),
                                                      ),
                                                    ),
                                                    IconButton(onPressed: (){
                                                      sound();
                                                      Navigator.pop(context);
                                                    }, icon: Icon(Icons.close,color: Colors.white,size: 30,))
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(

                                                  border: Border.all(color: Colors.transparent,width: 1),
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      Color(0xff570000),
                                                      Color(0xff8d0303),
                                                      Color(0xffcc0707),
                                                      Color(0xffea0909),
                                                    ],
                                                  ),

                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 25.0,
                                                    ),
                                                  ],
                                                ),
                                                height: MediaQuery.of(context).size.height * 0.5,
                                                width: MediaQuery.of(context).size.width * 0.5,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset("assets/new/ribon.png",
                                                      height: MediaQuery.of(context).size.height * 0.2,
                                                      width: MediaQuery.of(context).size.width * 0.2,

                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text("VirtualCasino",
                                                      style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                          fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black
                                                      ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text("v1.11.33",
                                                      style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                          fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                                      ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text("Our Privacy and Policy provide legal and fun Games for Enjoy \nmore policy can be define here",
                                                      style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                          fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                                      ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          )),
                                      content: Container(child: Text("hi"),)
                                  )
                          );
                            },
                            child: Container(
                              height: 55,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.yellow,width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff570000),
                                    Color(0xff8d0303),
                                    Color(0xffcc0707),
                                    Color(0xffea0909),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 25.0,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                hoverColor: Color(0xff041fa2),
                                leading: CircleAvatar(child: Icon(Icons.branding_watermark)),
                                title: Text('Terms & Conditions',style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                    fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                ),
                                ),),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          InkWell( onTap: (){
                            sound();
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (ctx) =>
                                  AlertDialog(
                                      backgroundColor: Colors.transparent,
                                      title: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.transparent,
                                              width: 0,
                                            ),
                                            color: Colors.white,
                                            // borderRadius: BorderRadius.all(Radius.circular(50))
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: MediaQuery.of(context).size.width * 0.5,
                                                color: Colors.yellow,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Center(
                                                      child: Text(" Our Privacy",
                                                        style: GoogleFonts.playfairDisplay(textStyle:TextStyle(
                                                            fontSize: 22,fontWeight: FontWeight.bold,color: Colors.yellow.shade900
                                                        ),
                                                        ),),
                                                    ),
                                                    IconButton(onPressed: (){
                                                      sound();
                                                      Navigator.pop(context);
                                                    }, icon: Icon(Icons.close,color: Colors.white,size: 30,))
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(

                                                  border: Border.all(color: Colors.transparent,width: 1),
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      Color(0xff570000),
                                                      Color(0xff8d0303),
                                                      Color(0xffcc0707),
                                                      Color(0xffea0909),
                                                    ],
                                                  ),

                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 25.0,
                                                    ),
                                                  ],
                                                ),
                                                height: MediaQuery.of(context).size.height * 0.5,
                                                width: MediaQuery.of(context).size.width * 0.5,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset("assets/new/ribon.png",
                                                      height: MediaQuery.of(context).size.height * 0.2,
                                                      width: MediaQuery.of(context).size.width * 0.2,
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text("VirtualCasino",
                                                      style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                          fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black
                                                      ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text("v1.11.33",
                                                      style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                          fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                                      ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text("Our Privacy and Policy provide legal and fun Games for Enjoy \nmore policy can be define here",
                                                      style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                          fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                                      ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                      content: Container(child: Text("hi"),)
                                  )
                          );
                            },
                            child: Container(
                              height: 55,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.yellow,width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff570000),
                                    Color(0xff8d0303),
                                    Color(0xffcc0707),
                                    Color(0xffea0909),
                                  ],
                                ),

                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 25.0,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                hoverColor: Color(0xff041fa2),
                                leading: CircleAvatar(child: Icon(Icons.privacy_tip)),
                                title: Text('Privacy tip',style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                    fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                ),
                                ),),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          InkWell( onTap: (){sound();
                            Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (ctx) =>
                                  AlertDialog(
                                      backgroundColor: Colors.transparent,
                                      title: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.transparent,
                                              width: 0,
                                            ),
                                            color: Colors.white,
                                            // borderRadius: BorderRadius.all(Radius.circular(50))
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: MediaQuery.of(context).size.width * 0.5,
                                                color: Colors.yellow,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Center(
                                                      child: Text(" About Us",
                                                        style: GoogleFonts.playfairDisplay(textStyle:TextStyle(
                                                            fontSize: 22,fontWeight: FontWeight.bold,color: Colors.yellow.shade900
                                                        ),
                                                        ),),
                                                    ),
                                                    IconButton(onPressed: (){
                                                      sound();
                                                      Navigator.pop(context);
                                                    }, icon: Icon(Icons.close,color: Colors.white,size: 30,))
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(

                                                  border: Border.all(color: Colors.transparent,width: 1),
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      Color(0xff570000),
                                                      Color(0xff8d0303),
                                                      Color(0xffcc0707),
                                                      Color(0xffea0909),
                                                    ],
                                                  ),

                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 25.0,
                                                    ),
                                                  ],
                                                ),
                                                height: MediaQuery.of(context).size.height * 0.5,
                                                width: MediaQuery.of(context).size.width * 0.5,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset("assets/new/ribon.png",
                                                      height: MediaQuery.of(context).size.height * 0.2,
                                                      width: MediaQuery.of(context).size.width * 0.2,
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text("VirtualCasino",
                                                      style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                          fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black
                                                      ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text("v1.11.33",
                                                      style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                          fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                                      ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text("(C)2023 Play Games24×7 Pvt. Ltd.",
                                                      style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                          fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                                      ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text("Our Privacy and Policy provide legal and fun Games for Enjoy.",
                                                      style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                          fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                                      ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                      content: Container(child: Text("hi"),)
                                  )
                          );
                            },
                            child: Container(
                              height: 55,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.yellow,width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff570000),
                                    Color(0xff8d0303),
                                    Color(0xffcc0707),
                                    Color(0xffea0909),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 25.0,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                hoverColor: Color(0xff041fa2),
                                leading: CircleAvatar(child: Icon(Icons.account_box_outlined)),
                                title: Text('About Us',style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                    fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                ),
                                ),),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          InkWell(
                            onTap: (){
                            sound();
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (ctx) =>
                                    AlertDialog(
                                        backgroundColor: Colors.transparent,
                                        title: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.transparent,
                                                width: 0,
                                              ),
                                              color: Colors.white,
                                              // borderRadius: BorderRadius.all(Radius.circular(50))
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: MediaQuery.of(context).size.width * 0.5,
                                                  color: Colors.yellow,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Center(
                                                        child: Text(" Contact us",
                                                          style: GoogleFonts.playfairDisplay(textStyle:TextStyle(
                                                              fontSize: 22,fontWeight: FontWeight.bold,color: Colors.yellow.shade900
                                                          ),
                                                          ),),
                                                      ),
                                                      IconButton(onPressed: (){
                                                        sound();
                                                        Navigator.pop(context);
                                                      }, icon: Icon(Icons.close,color: Colors.white,size: 30,))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(

                                                    border: Border.all(color: Colors.transparent,width: 1),
                                                    gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end: Alignment.bottomRight,
                                                      colors: [
                                                        Color(0xff570000),
                                                        Color(0xff8d0303),
                                                        Color(0xffcc0707),
                                                        Color(0xffea0909),
                                                      ],
                                                    ),

                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 25.0,
                                                      ),
                                                    ],
                                                  ),
                                                  height: MediaQuery.of(context).size.height * 0.5,
                                                  width: MediaQuery.of(context).size.width * 0.5,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      SizedBox(height: 10,),
                                                      Text("VirtualCasino",
                                                        style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                            fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black
                                                        ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 10,),
                                                      Text("For Support mail us to : supportteam@gmail.com",
                                                        style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                            fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                                        ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 10,),
                                                      Text("For Support Contact us to : +91 1234567890",
                                                        style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                            fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                                        ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                        content: Container(child: Text("hi"),)
                                    )
                            );
                            },
                            child: Container(
                              height: 55,
                              width: 200,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.yellow,width: 1),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff570000),
                                    Color(0xff8d0303),
                                    Color(0xffcc0707),
                                    Color(0xffea0909),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 25.0,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                hoverColor: Color(0xff041fa2),
                                leading: CircleAvatar(child: Icon(Icons.headset_mic)),
                                title: Text('Contact Us',style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                    fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                ),
                                ),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
        }, icon: Image.asset("assets/home/btn_kefu.png",height: 70,width: 70,)),

        IconButton(onPressed: () async {
          sound();
          showDialog(
              context: context!,
              builder: (ctx) =>
                  AlertDialog(
                      backgroundColor: Colors.transparent,
                      content:Container(
                        height: 200,
                        width: 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/home/bg_help.png'),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Icon(Icons.settings,color: Colors.white,),
                              ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text('Setting',
                                    style:  GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                      fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,
                                    ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  children: [
                                    TextButton(onPressed: (){},
                                        child: Text('Terms & Condition ',
                                          style: TextStyle(fontSize: 8,color: Colors.white,decoration: TextDecoration.underline,),)),

                                    TextButton(onPressed: (){},
                                        child: Text('Privacy Policy',
                                          style: TextStyle(fontSize: 8,color: Colors.white,decoration: TextDecoration.underline,),)),
                                    TextButton(onPressed: (){},
                                        child: Text('About Us',
                                          style: TextStyle(fontSize: 8,color: Colors.white,decoration: TextDecoration.underline,),)),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 18.0),
                                      child: Container(
                                        height: 60,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage('assets/home/bg_prompt.png'),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                                onPressed: ()async{
                                                  final prefs = await SharedPreferences.getInstance();
                                                  final soundsl= await prefs.getBool('sounds') ?? false;
                                                  if(soundsl==false) {
                                                    setState(() {
                                                      music = true;
                                                    });

                                                  }else{
                                                    setState(() {
                                                      music = false;
                                                    });
                                                  }
                                                  await prefs.setBool('sounds', music);
                                                  sound();
                                                  show(context);
                                                  print("object");
                                                  print(soundsl);


                                                }, icon:music!=false?
                                            Image.asset("assets/home/icon_music.png",height: 40,width: 40,):
                                            Image.asset("assets/home/icon_music_0.png",height: 40,width: 40,)


                                              //
                                              // Icon(soundval!=false?Icons.volume_up:Icons.volume_off_rounded,
                                              //     size: 20,color: Colors.orange.shade300)
                                            ),
                                            IconButton(
                                                onPressed: ()async{
                                                  final prefs = await SharedPreferences.getInstance();
                                                  final soundsl= await prefs.getBool('sounds') ?? false;
                                                  if(soundsl==false) {
                                                    setState(() {
                                                      soundval = true;
                                                    });

                                                  }else{
                                                    setState(() {
                                                      soundval = false;
                                                    });
                                                  }
                                                  await prefs.setBool('sounds', soundval);
                                                  sound();
                                                  show(context);
                                                  print("object");
                                                  print(soundsl);


                                                }, icon:soundval!=false?
                                            Image.asset("assets/home/icon_sound.png",height: 40,width: 40,):
                                            Image.asset("assets/home/icon_sound_0.png",height: 40,width: 40,)


                                              //
                                              // Icon(soundval!=false?Icons.volume_up:Icons.volume_off_rounded,
                                              //     size: 20,color: Colors.orange.shade300)
                                            ),
                                          ],
                                        ),

                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage('assets/home/btn_sure.png'),
                                      ),
                                    ),
                                    child:Shimmer.fromColors(
                                      baseColor: Color(0xfff58606) ,
                                      highlightColor: Colors.white,
                                      child: Padding(
                                        padding:  EdgeInsets.only(bottom: 5.0),
                                        child: Text('Logout',
                                          style:  GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                            fontSize: 18,fontWeight: FontWeight.w900,color: Color(0xff856225),
                                          ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          )

                          ],
                        ),
                      )
                    // },
                    // ),
                    // ),
                  ));
        },
            icon:Image.asset("assets/home/setting.png",height: 70,width: 70,) ),

      ],

    );

  }

  show(BuildContext  context) {


  }
  var amount='0';
  var name='Your Name';
  var photo;
  var number='123546781';
   bowe() async {
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

  var id='1234565879';
  var user_id='Your Name';
  var description = "welcome";
  var status='123546781';
  var title='123546781';
  var datetime="dd/mm/yy";
  var bet="Empty";

  notification() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    print(value);

    final response = await http.get(
      Uri.parse(Apiconstant.baseurl + 'notification?user_id=$value'),
    );

    final jsond = json.decode(response.body)["data"];
    setState(() {
      var fdaa=jsond[0];
      id=fdaa["id"];
      user_id= fdaa["user_id"];
      description= fdaa["description"];
      status=fdaa["status"];
      title=fdaa["title"];
      datetime=fdaa["datetime"];
      bet=fdaa["bet"];
    });
    print(jsond);

  }
}


