// import 'package:audioplayers/audioplayers.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';
// import 'package:virtualcasino/AndarBahar/home_page.dart';
// import 'package:virtualcasino/AndarBahar/welcomeAndar.dart';
// import 'package:virtualcasino/FUN_casino/Fun_Home.dart';
// // import 'package:virtualcasino/FUN_casino/welcomeFuncasino.dart';
// import 'package:virtualcasino/HomeDirectory/DragonTheam.dart';
// import 'package:virtualcasino/HomeDirectory/GameDesign.dart';
// import 'package:virtualcasino/HomeDirectory/addcash%20page.dart';
// import 'package:virtualcasino/constant/apihelper.dart';
// import 'package:virtualcasino/customappbar/Drawer.dart';
// import 'package:virtualcasino/customappbar/customappbar.dart';
// import 'package:virtualcasino/dragonTiger/home.dart';
// import 'package:virtualcasino/dragonTiger/welcomeTiger.dart';
// import 'package:virtualcasino/roulette/RoulleteHome.dart';
// import 'package:virtualcasino/roulette/welomerollet.dart';
// import 'package:virtualcasino/triplefun/Triple_fun_RoulleteHome.dart';
// import 'package:virtualcasino/triplefun/welcomefun.dart';
// import 'package:virtualcasino/triplefun/welcometripal.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
//
// class Payin extends StatefulWidget {
//   const Payin({Key? key}) : super(key: key);
//
//   @override
//   State<Payin> createState() => _NewHomePageState();
// }
//
// class _NewHomePageState extends State<Payin> {
//   final AudioCache _player = AudioCache();
//
//   @override
//   void initState() {
//     sound();
//     // TODO: implement initState
//     super.initState();
//   }
//
//   sound()async{
//     final prefs = await SharedPreferences.getInstance();
//     final soundsl= await prefs.getBool('sounds')??false;
//     soundsl ==false?print('ok'):
//     await _player.play('audio/click_sound.mp3');
//   }
//   @override
//   Widget build(BuildContext context) {
//     final height=110.00;
//     final width =110.00;
//     return SafeArea(
//         child: Scaffold(
//           backgroundColor: Colors.transparent,
//           appBar: CustomAppBarTwo(),
//           endDrawer: Drawers(),
//           bottomNavigationBar: Container(
//             height: 100,
//             width: double.infinity,
//             child: Column(
//               children: [
//             Text("Ref Code : DO",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
//     fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white,
//     ),)),
//
//               ],
//             ),
//           ),
//
//
//
//           body: CachedNetworkImage(
//             imageUrl: Apiconstant.gifurl + "home.gif",
//             imageBuilder: (context, imageProvider) => Container(
//               height: double.infinity,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: imageProvider,fit: BoxFit.fill,
//                   )
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//
//
//                   Column(
//                     children: [
//                       SizedBox(height: 50,),
//                       InkWell(
//                         onTap: ()async{
//                           sound();
//                           // Navigator.push(context, MaterialPageRoute(builder: (context)=> welcomerollet()));
//                         },
//                         child: Container(
//                           height: height,
//                           width: width,
//                           child: Stack(
//                             clipBehavior: Clip.none,
//                             children: [
//
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 20, left: 10),
//                                 child: Container(
//                                   height: height,
//                                   width: width,
//                                   decoration: BoxDecoration(
//                                       gradient: LinearGradient(
//                                         begin: Alignment.topLeft,
//                                         end: Alignment.bottomRight,
//                                         colors: [
//                                           Color(0xffea0909),
//                                           Color(0xffcc0707),
//                                           Color(0xff8d0303),
//                                           Color(0xff570000),
//                                         ],
//                                       ),
//                                       border: Border.all(color: Colors.yellow,width: 1),
//                                       borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(10),
//                                         topRight: Radius.circular(10),
//                                         bottomLeft: Radius.circular(10),
//                                         bottomRight: Radius.circular(10),
//                                       )
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 left: 30,
//                                 top: 30,
//                                 child: Center(
//                                   child: Container(
//                                       height: height*0.5,
//                                       width: width*0.5,
//                                       decoration: const BoxDecoration(
//                                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                                       color: Colors.transparent
//                                       ),
//                                       child: Center(
//                                         child: Text("Pay In",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
//                                             fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white,
//                                         ),
//                                         ),),
//                                       )),
//                                 ),
//                               ),
//                               // Positioned(
//                               //   bottom: height*0.02,
//                               //   left: -width*0.028,
//                               //   child: Container(
//                               //     height: 40,
//                               //     width: 120,
//                               //     decoration: BoxDecoration(
//                               //         image: DecorationImage(
//                               //           image: AssetImage('assets/new/ribon.png',),fit: BoxFit.fill,
//                               //         )
//                               //     ),
//                               //     child:Center(child: Padding(
//                               //         padding: const EdgeInsets.only(top: 9),
//                               //         child: GradientText(
//                               //           widget.gamename,
//                               //           style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
//                               //               fontSize: 15.0,fontWeight: FontWeight.bold
//                               //           ),
//                               //           ),
//                               //           gradientType: GradientType.linear,
//                               //           gradientDirection: GradientDirection.ttb,
//                               //           radius: .4,
//                               //           colors: [
//                               //             Color(0xffec5500),
//                               //             Colors.black,
//                               //           ],
//                               //         )
//                               //     )),
//                               //
//                               //     // Image.asset('assets/new/ribon.png')
//                               //   ),
//                               // ),
//                             ],
//
//
//                           ),
//                         )
//                       ),
//
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             placeholder: (context, url) => Image.asset("assets/girls/casinobed.jpg",height: double.infinity,width: double.infinity,fit: BoxFit.fill,),
//             errorWidget: (context, url, error) => Icon(Icons.error),
//           ),
//         ));
//   }
// }