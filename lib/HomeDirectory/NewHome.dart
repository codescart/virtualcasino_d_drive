import 'dart:async';
import 'package:flutter_share/flutter_share.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:virtualcasino/AndarBahar/home_page.dart';
import 'package:virtualcasino/AndarBahar/welcomeAndar.dart';
import 'package:virtualcasino/FUN_casino/Fun_Home.dart';
// import 'package:virtualcasino/FUN_casino/welcomeFuncasino.dart';
import 'package:virtualcasino/HomeDirectory/DragonTheam.dart';
import 'package:virtualcasino/HomeDirectory/GameDesign.dart';
import 'package:virtualcasino/HomeDirectory/addcash%20page.dart';
import 'package:virtualcasino/constant/apihelper.dart';
import 'package:virtualcasino/customappbar/Drawer.dart';
import 'package:virtualcasino/customappbar/customappbar.dart';
import 'package:virtualcasino/dragonTiger/home.dart';
import 'package:virtualcasino/dragonTiger/welcomeTiger.dart';
import 'package:virtualcasino/roulette/RoulleteHome.dart';
import 'package:virtualcasino/roulette/welomerollet.dart';
import 'package:virtualcasino/shimmerWidigt/shimmer.dart';
import 'package:virtualcasino/triplefun/Triple_fun_RoulleteHome.dart';
import 'package:virtualcasino/triplefun/welcomefun.dart';
import 'package:virtualcasino/triplefun/welcometripal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:marquee/marquee.dart';
import 'package:virtualcasino/wallethistory/add_widraw.dart';
import 'package:virtualcasino/wallethistory/walletwidraw.dart';

import '../marqueee/marque.dart';
import 'package:carousel_slider/carousel_slider.dart';


class NewHomePage extends StatefulWidget {
  final String number;
  const NewHomePage({Key? key, required this.number}) : super(key: key);

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Referrel Code : '+ widget.number ,
        text: 'Join Now & Get Exiting Prizes. here is my Referrel Code : ' + widget.number,
        linkUrl: 'https://mmatka.com/',
        chooserTitle: 'Referrel Code :'+widget.number );
  }
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBarTwo(),
          endDrawer: Drawers(),

          body: Container(

              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/home/background_2.png'),
                    fit: BoxFit.fill,
                  )
              ),
              child: Stack(
                clipBehavior:Clip.none,
                children: [

                  Positioned(
                    height: MediaQuery.of(context).size.width*0.07,
                    width: MediaQuery.of(context).size.width,
                    bottom: 0,
                      child:Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/home/plaza_sp_bottombg.png'),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                print('qqqqqqqqqqqqqq');
                                sound();
                                showDialog(
                                    context: context,
                                    builder: (ctx) =>
                                        AlertDialog(
                                            backgroundColor: Colors.transparent,
                                            content: Container(

                                              height: MediaQuery.of(context).size.height*0.70,
                                              width: MediaQuery.of(context).size.height*0.80,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage('assets/home/bg_picture1.png'),
                                                ),
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
                                                  SizedBox(height: 10,),
                                                  Container(
                                                    height:50,
                                                    width:50,
                                                    child: Image.asset("assets/new/coins.png"),),
                                                  SizedBox(height: 5,),
                                                  Container(
                                                    height: 70,
                                                    width: 250,
                                                    child: Text("Get Coin 50 \nfor new friend who jion!",textAlign: TextAlign.center,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                        fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white
                                                    ),
                                                    ),),
                                                  ),
                                                  SizedBox(height: 25,),
                                                  InkWell(
                                                    onTap: () async {
                                                      share();
                                                      sound();

                                                    },
                                                    child: Container(
                                                      height: 40.0,
                                                      width: 170.0,
                                                     child: Image.asset("assets/home/refer&earn.png")

                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                        )
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 80,
                                width: 130,
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
                                    child: Text('Refer & Earn',
                                      style:  GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w900,color: Color(0xff856225),
                                      ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ), ),
                  Positioned(
                    bottom: 0,
                    right: 1,
                    child: InkWell(
                      onTap: ()async{
                        sound();
                      print("hhhhhhhhhhhhh");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>addcash()));
                      },
                      child: Container(
                        height: 60,
                        width: 160,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/home/btn_buy.png'),
                          ),
                        ),
                        child: Center(child: Padding(
                          padding:  EdgeInsets.only(top: 18.0),
                          child: Center(
                              child: Shimmer.fromColors(
                                baseColor: Color(0xff856225) ,
                                highlightColor: Colors.white,
                                child: Text('Pay',
                                  style:  GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                  fontSize: 22,fontWeight: FontWeight.w900,color: Color(0xff856225),
                                ),
                          ),
                                ),
                              )),

                        )),
                      ),
                    ),),
                  Positioned(
                    bottom: 0,
                    right: 160,
                    child: InkWell(
                      onTap: ()async{
                        sound();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_Widraw()));
                      },
                      child: Column(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Color(0xffff9a00),
                            highlightColor: Colors.white,
                            child: Container(
                              height: 30,
                              width: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/home/btn_withdrawl.png'),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            child: Shimmer.fromColors(
                              baseColor: Color(0xfffa9f02) ,
                              highlightColor: Colors.white,
                              child: Text('Withdraw',
                                style:  GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                  fontSize: 10,fontWeight: FontWeight.bold,color: Color(0xff856225),
                                ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),),
                  Positioned(
                    bottom: 0,
                    right: 240,
                    child: InkWell(
                      onTap: ()async{
                        sound();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>addcash()));
                      },
                      child: Column(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Color(0xfffdbb61) ,
                            highlightColor: Colors.white,
                            child: Container(
                              height: 40,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/home/btn_rank.png'),
                                ),
                              ),

                            ),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            child: Shimmer.fromColors(
                              baseColor: Color(0xfffa9f02) ,
                              highlightColor: Colors.white,
                              child: Text('Pay',
                                style:  GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                  fontSize: 10,fontWeight: FontWeight.bold,color: Color(0xff856225),
                                ),
                                ),
                              ),
                            ),
                          )

                        ],
                      ),
                    ),),
                  Positioned(
                    bottom: 0,
                    right: 310,
                    child: InkWell(
                      onTap: ()async{
                        sound();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>addcash()));
                      },
                      child: Column(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Color(0xfffdbb61) ,
                            highlightColor: Colors.white,
                            child: Container(
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/home/btn_result.png'),
                                ),
                              ),

                            ),
                          ),
                          Container(

                            alignment: Alignment.topCenter,
                            child: Shimmer.fromColors(
                              baseColor: Color(0xfffa9f02) ,
                              highlightColor: Colors.white,
                              child: Text('Notice',
                                style:  GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                  fontSize: 10,fontWeight: FontWeight.bold,color: Color(0xff856225),
                                ),
                                ),
                              ),
                            ),
                          )

                        ],
                      ),
                    ),),
                  Positioned(
                    bottom: 0,
                    right: 400,
                    child: InkWell(
                      onTap: ()async{
                        sound();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>addcash()));
                      },
                      child: Column(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Color(0xfffdbb61) ,
                            highlightColor: Colors.white,
                            child: Container(
                              height: 27,
                              width: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/home/btn_prize.png'),
                                ),
                              ),

                            ),
                          ),
                          Container(

                            alignment: Alignment.topCenter,
                            child: Shimmer.fromColors(
                              baseColor: Color(0xfffa9f02) ,
                              highlightColor: Colors.white,
                              child: Text('Gifts',
                                style:  GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                  fontSize: 10,fontWeight: FontWeight.bold,color: Color(0xff856225),
                                ),
                                ),
                              ),
                            ),
                          )

                        ],
                      ),
                    ),),

                  Container(
                    height: MediaQuery.of(context).size.height*0.725,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: ()async{
                                sound();
                               // Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeAndar()));
                              },
                              child: Container(
                                height: 350,
                                width: 150,
                                child: CarouselSlider(
                                    options: CarouselOptions(
                                      height: 350,
                                      aspectRatio: 16/9,
                                      viewportFraction: 0.9,
                                      initialPage: 0,
                                      enableInfiniteScroll: true,
                                      reverse: false,
                                      autoPlay: true,
                                      autoPlayInterval: Duration(seconds: 3),
                                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.3,
                                     // onPageChanged: callbackFunction,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  items: [1,2,3,4,5].map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                            width: 400,
                                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                                            child:Image.asset("assets/home/ad_2.png",height: 130,width: 130,)
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: ()async{
                                sound();
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeAndar()));
                              },
                              child: Container(

                                child: Image.asset('assets/home/tournament.png',
                                height: 200,
                                  width: 100,
                                ),
                              ),
                            ),

                            Column(
                              children: [
                                InkWell(
                                  onTap: ()async{
                                    sound();
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>welcometiger()));
                                  },
                                  child:
                                  Stack(

                                    children: [
                                      Container(
                                          height: 120,
                                          width: 180,
                                          child: Image.asset('assets/home/andarbaharicon.png',

                                          )),
                                      Positioned(
                                        top: 10,
                                        right: 8,

                                        child: InkWell(
                                          onTap: ()async{
                                            sound();
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>addcash()));
                                          },
                                          child: Container(
                                            height: 27,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage('assets/home/hot.png'),
                                              ),
                                            ),
                                              child: Center(child: Center(
                                                  child: Shimmer.fromColors(
                                                    baseColor: Colors.green ,
                                                    highlightColor: Colors.white,
                                                    child: Text('HOT',
                                                      style:  GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                        fontSize: 10,fontWeight: FontWeight.w900,color: Color(0xff856225),
                                                      ),
                                                      ),
                                                    ),
                                                  )))
                                          ),
                                        ),),
                                    ],
                                  ),
                                ),

                                InkWell(
                                  onTap: ()async{
                                    sound();
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeAndar()));

                                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>welcometripel()));

                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                          height: 120,
                                          width: 180,
                                          child: Image.asset('assets/home/gameiconImg_145.png',

                                          )),
                                      Positioned(
                                        top: 10,
                                        right: 8,

                                        child: InkWell(
                                          onTap: ()async{
                                            sound();
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>addcash()));
                                          },
                                          child: Container(
                                              height: 27,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage('assets/home/hot.png'),
                                                ),
                                              ),
                                              child: Center(child: Center(
                                                  child: Shimmer.fromColors(
                                                    baseColor: Colors.green ,
                                                    highlightColor: Colors.white,
                                                    child: Text('HOT',
                                                      style:  GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                        fontSize: 10,fontWeight: FontWeight.w900,color: Color(0xff856225),
                                                      ),
                                                      ),
                                                    ),
                                                  )))
                                          ),
                                        ),),
                                    ],
                                  ),

                                  // GameDesign(gamename: 'Triple Fun', gamegif: 'assets/new/chakra.gif',),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: ()async{
                                    sound();
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> welcomerollet()));
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                          height: 120,
                                          width: 180,
                                          child: Image.asset('assets/home/roulleteicon.png',)),
                                      Positioned(
                                        top: 10,
                                        right: 8,

                                        child: InkWell(
                                          onTap: ()async{
                                            sound();
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>addcash()));
                                          },
                                          child: Container(
                                              height: 27,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage('assets/home/hot.png'),
                                                ),
                                              ),
                                              child: Center(child: Center(
                                                  child: Shimmer.fromColors(
                                                    baseColor: Colors.green ,
                                                    highlightColor: Colors.white,
                                                    child: Text('HOT',
                                                      style:  GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                        fontSize: 10,fontWeight: FontWeight.w900,color: Color(0xff856225),
                                                      ),
                                                      ),
                                                    ),
                                                  )))
                                          ),
                                        ),),

                                    ],
                                  ),
                                  // GameDesign(gamename: 'Fun Roulette', gamegif: 'assets/home/roulleteicon.png',),
                                ),
                                InkWell(
                                  onTap: ()async{
                                    sound();
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>welcomeFuncasino()));
                                  },
                                  child:Stack(
                                    clipBehavior: Clip.none,
                                    children: [


                                      Container(
                                          height: 140,
                                          width: 140,
                                          child: Image.asset('assets/home/FUNTARGETICON.png',)),
                                      Positioned(
                                        top: 10,
                                        right: -10,

                                        child: InkWell(
                                          onTap: ()async{
                                            sound();
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>addcash()));
                                          },
                                          child: Container(
                                              height: 27,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage('assets/home/hot.png'),
                                                ),
                                              ),
                                              child: Center(child: Center(
                                                  child: Shimmer.fromColors(
                                                    baseColor: Colors.green ,
                                                    highlightColor: Colors.white,
                                                    child: Text('HOT',
                                                      style:  GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                        fontSize: 10,fontWeight: FontWeight.w900,color: Color(0xff856225),
                                                      ),
                                                      ),
                                                    ),
                                                  )))
                                          ),
                                        ),),
                                    ],
                                  ),
                                  // GameDesign(gamename: 'Fun Target', gamegif: 'assets/new/rolete2.gif',),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: ()async{
                                    sound();
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>welcometripel()));
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                          height: 120,
                                          width: 140,
                                          child: Image.asset('assets/home/tripleicon.png',)),
                                      Positioned(
                                        top: 10,
                                        right: 8,

                                        child: InkWell(
                                          onTap: ()async{
                                            sound();
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>addcash()));
                                          },
                                          child: Container(
                                              height: 27,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage('assets/home/hot.png'),
                                                ),
                                              ),
                                              child: Center(child: Center(
                                                  child: Shimmer.fromColors(
                                                    baseColor: Colors.green ,
                                                    highlightColor: Colors.white,
                                                    child: Text('HOT',
                                                      style:  GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                        fontSize: 10,fontWeight: FontWeight.w900,color: Color(0xff856225),
                                                      ),
                                                      ),
                                                    ),
                                                  )))
                                          ),
                                        ),),

                                    ],
                                  ),
                                  // GameDesign(gamename: 'Fun Roulette', gamegif: 'assets/home/roulleteicon.png',),
                                ),
                                InkWell(
                                  onTap: ()async{
                                    sound();
                                   // Navigator.push(context, MaterialPageRoute(builder: (context)=>welcomeFuncasino()));
                                  },
                                  child:Stack(
                                    clipBehavior: Clip.none,
                                    children: [


                                      Container(
                                          height: 120,
                                          width: 180,
                                          child: Image.asset('assets/home/rummyicon.png',)),
                                      Positioned(
                                        top: 10,
                                        right: 5,

                                        child: InkWell(
                                          onTap: ()async{
                                            sound();
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>addcash()));
                                          },
                                          child: Container(
                                              height: 27,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage('assets/home/hot.png'),
                                                ),
                                              ),
                                              child: Center(child: Center(
                                                  child: Shimmer.fromColors(
                                                    baseColor: Colors.green ,
                                                    highlightColor: Colors.white,
                                                    child: Text('HOT',
                                                      style:  GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                        fontSize: 10,fontWeight: FontWeight.w900,color: Color(0xff856225),
                                                      ),
                                                      ),
                                                    ),
                                                  )))
                                          ),
                                        ),),
                                    ],
                                  ),
                                  // GameDesign(gamename: 'Fun Target', gamegif: 'assets/new/rolete2.gif',),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ),
        );
  }
}