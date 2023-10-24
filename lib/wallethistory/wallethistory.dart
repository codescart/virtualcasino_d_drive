import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualcasino/constant/apihelper.dart';


class Wallethistory extends StatefulWidget {
  const Wallethistory({Key? key}) : super(key: key);

  @override
  State<Wallethistory> createState() => _homeState();
}
class _homeState extends State<Wallethistory> {
  final AudioCache _player = AudioCache();
  var soundval=false;
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
    return Dialog(
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }
  _buildChild(BuildContext context) =>Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage('assets/home/bg_help.png'),
      ),
    ),

    child:Column(

        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            width: 450,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text("Wallet History",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                      fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black
                  ),
                  ),
                  ),
                ),
                IconButton(onPressed: (){
                  sound();
                  Navigator.pop(context);
                }, icon: Icon(Icons.close_rounded,color: Colors.transparent,)
                )
              ],
            ),
          ),
          SizedBox(
              height: 210,
              width: 400,
              child: FutureBuilder<List<Alb>>(
                  future: bowe(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context,int index)=>
                            Container(
                              height: MediaQuery.of(context).size.height * 0.28,
                              width: 400,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      SizedBox(width: 10,),
                                      Image.asset("assets/home/coins.png",height: 20,width: 20,),
                                      SizedBox(width: 10,),
                                      Column(
                                        children: [
                                          Text("Total Coin",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                            fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,
                                          ),
                                          ),
                                          ),
                                          SizedBox(height: 10,),
                                          Text("${snapshot.data![index].amount}",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                            fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,
                                          ),
                                          ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: [
                                          Text("About",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                            fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,
                                          ),
                                          ),
                                          ),
                                          SizedBox(height: 10,),
                                          Text("${snapshot.data![index].description}",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                            fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,
                                          ),
                                          ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: [
                                          Text("Date & Time",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                            fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,
                                          ),
                                          ),
                                          ),
                                          SizedBox(height: 10,),
                                          Text(
                                            "${snapshot.data![index].datetime}",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                            fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,
                                          ),
                                          ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Divider(thickness: 1.5,color: Colors.white,),
                                ],
                              ),
                            )
                    ) : Center(
                        child:CircularProgressIndicator(color: Colors.red,)
                    );
                  }
              )
          ),
        ]
    ),
  );

  Future<List<Alb>> bowe() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    final response = await http.get(
      Uri.parse(Apiconstant.baseurl+'wallet_history?user_id=$value'),
    );
    print(Apiconstant.baseurl+'wallet_history?user_id=1');
    final jsond = json.decode(response.body)["country"];
    print(jsond);
    List<Alb> allround = [];
    for (var o in jsond)  {
      Alb al = Alb(
        o["id"],
        o["user_id"],
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
  String? id;
  String? user_id;
  String? amount;
  String? description;
  String? status;
  String? datetime;

  Alb(this.id,
      this.user_id,
      this.amount,
      this.description,
      this.status,
      this.datetime,

      );

}