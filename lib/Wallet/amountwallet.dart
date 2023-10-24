import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:virtualcasino/Add_Acount/account.dart';
import 'package:virtualcasino/Add_Acount/accountdetail.dart';
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
import 'package:virtualcasino/triplefun/Triple_fun_RoulleteHome.dart';
import 'package:virtualcasino/triplefun/welcomefun.dart';
import 'package:virtualcasino/triplefun/welcometripal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualcasino/wallethistory/add_widraw.dart';
import 'package:virtualcasino/wallethistory/wallethistory.dart';
import 'package:virtualcasino/wallethistory/walletwidraw.dart';



class amountwallet extends StatefulWidget {
  const amountwallet({Key? key}) : super(key: key);

  @override
  State<amountwallet> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<amountwallet> {
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
    final height=120.00;
    final width =120.00;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/home/home.png'),
    fit: BoxFit.fill,
    )
    ),
            child:  Stack(
              children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: ()async{
                              sound();

                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_Widraw()));
                            },
                            child: Container(
                              height: height,
                              width: width,
                              child: Container(
                                height: height,
                                width: width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/home/bg_room01.png'),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right:18.0),
                                    child: Text("Widarwal",textAlign: TextAlign.center,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                        fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white
                                    ),
                                    ),),
                                  ),
                                ),
                              ),
                            )
                        ),
                        InkWell(
                            onTap: ()async{
                              sound();
                              showDialog(
                                  context: context!,
                                  builder: (ctx) =>
                                      AlertDialog(
                                        backgroundColor: Colors.transparent,
                                        content: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage("assets/home/bg_help.png",)
                                                )
                                            ),
                                            height: MediaQuery.of(context).size.height * 0.6,
                                            width: MediaQuery.of(context).size.width * 0.6,
                                            child: Column(
                                              children: [

                                                SizedBox(height: 10,),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 22.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Text('Type',textAlign: TextAlign.center,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                          fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                                      ),
                                                      ),
                                                      ),
                                                      Text('Amount',textAlign: TextAlign.center,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                          fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                                      ),
                                                      ),
                                                      ),
                                                      Text('Description',textAlign: TextAlign.center,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                          fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                                      ),
                                                      ),
                                                      ),
                                                      InkWell(
                                                        onTap: (){
                                                          sound();
                                                          Navigator.pop(context);
                                                        },
                                                        child: Container(
                                                          height: 20,
                                                          width: 40,
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),

                                                Column(
                                                  children: [
                                                    SizedBox(height: 10,),
                                                    Container(
                                                      height: MediaQuery.of(context).size.height * 0.4,
                                                      child: FutureBuilder<List<Alb>>(
                                                          future: Payinhistory(),
                                                          builder: (context, snapshot) {
                                                            if (snapshot.hasError) print(snapshot.error);
                                                            return snapshot.hasData
                                                                ? ListView.builder(
                                                                itemCount: snapshot.data!.length,
                                                                itemBuilder: (BuildContext context,int index)=>
                                                                    Container(
                                                                      height: MediaQuery.of(context).size.height * 0.2,
                                                                      width: 400,

                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [

                                                                          Row(
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                            children: [
                                                                              Text(snapshot.data![index].type.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                                                fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                                                              ),
                                                                              ),
                                                                              ),
                                                                              Text(snapshot.data![index].amount.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                                                fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                                                              ),
                                                                              ),
                                                                              ),
                                                                              Text(snapshot.data![index].description.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                                                fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,
                                                                              ),
                                                                              ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )
                                                            ) : Center(
                                                                child:CircularProgressIndicator(
                                                                  color: Colors.red,
                                                                )
                                                            );
                                                          }
                                                      ),
                                                    )
                                                  ],
                                                ),

                                              ],
                                            )),
                                      ));

                            },
                            child: Container(
                              height: height,
                              width: width,
                              child: Container(
                                height: height,
                                width: width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/home/bg_room01.png'),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right:15,),
                                    child: Text("PayIn\n History",textAlign: TextAlign.center,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                        fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white
                                    ),
                                    ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: ()async{
                                sound();

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => AccountDetail(),
                                );
                              },
                              child: Container(
                                height: height,
                                width: width,
                                child: Container(
                                  height: height,
                                  width: width,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage('assets/home/bg_room01.png'),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right:15,),
                                      child: Text("Account\n Details",textAlign: TextAlign.center,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                          fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white
                                      ),
                                      ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ),
                          InkWell(
                              onTap: ()async{
                                sound();
//
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => WalletWidraw(),
                                );
                              },
                              child: Container(
                                height: height,
                                width: width,
                                child: Container(
                                  height: height,
                                  width: width,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage('assets/home/bg_room01.png'),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only( right: 15),
                                      child: Text("Widraw\n History",textAlign: TextAlign.center, style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                          fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white
                                      ),
                                      ),),
                                    ),
                                  ),
                                ),

                              )
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: ()async{
                              sound();

                              showDialog(
                                context: context,
                                builder: (BuildContext context) => Wallethistory(),
                              );

                            },
                            child: Container(
                              height: height,
                              width: width,
                              child: Container(
                                height: height,
                                width: width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/home/bg_room01.png'),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Text("Wallet\n History",textAlign: TextAlign.center,style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                        fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white
                                    ),
                                    ),
                                    ),
                                  ),
                                ),
                              ),

                            )
                        ),
                        InkWell(
                            onTap: ()async{
                              sound();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Addacount(),
                              ),
                              );


                            },
                            child: Container(
                              height: height,
                              width: width,
                              child: Container(
                                height: height,
                                width: width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/home/bg_room01.png'),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:  EdgeInsets.only(right: 15.0),
                                    child: Text("Add\nAccount",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                        fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white
                                    ),
                                    ),),
                                  ),
                                ),
                              ),

                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ));
  }




  Future<List<Alb>> Payinhistory() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    final response = await http.get(
      Uri.parse(Apiconstant.baseurl+'payinhistory?user_id=$value'),
    );

    final jsond = json.decode(response.body)["data"];
    print(jsond);
    List<Alb> allround = [];
    for (var o in jsond)  {
      Alb al = Alb(
        o["id"],
        o["user_id"],
        o["type"],
        o["amount"],
        o["description"],
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
  String type;
  String amount;
  String description;
  String status;
  String datetime;


  Alb(this.id,
      this.user_id,
      this.type,
      this.amount,
      this.description,
      this.status,
      this.datetime,
      );

}