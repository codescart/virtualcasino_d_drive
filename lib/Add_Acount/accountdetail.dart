import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualcasino/constant/apihelper.dart';


class AccountDetail extends StatefulWidget {
  const AccountDetail({Key? key}) : super(key: key);

  @override
  State<AccountDetail> createState() => _homeState();
}
class _homeState extends State<AccountDetail> {
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
    height: 300,
    width: 400,
    decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/home/qiandao.png",)
        )
    ),
    child:  Column(
      children: [
        Container(
          height: 60,
        ),
        Container(
          height: 225,
          width: 270,
          child: FutureBuilder<List<Alb>>(
              future: bowe(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? ListView.builder(
                  scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context,int index)=>
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (ctx) =>
                                    AlertDialog(
                                      backgroundColor: Colors.transparent,
                                      content: Container(
                                          height: 200,
                                          width: 350,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage("assets/home/bg_help.png",)
                                              )
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 50,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Bank Name",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                            fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white
                                                        ),
                                                        ),),
                                                        Text("Branch",style: GoogleFonts.playfairDisplay(textStyle:TextStyle(
                                                            fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white
                                                        ),
                                                        ),),
                                                        Text("Account Number",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                            fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white
                                                        ),
                                                        ),
                                                        ),
                                                        Text("Addhar Card",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                            fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white
                                                        ),
                                                        ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text('${snapshot.data![index].bank_name}',style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                            fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                                        ),
                                                        ),
                                                        ),
                                                        Text('${snapshot.data![index].branch}',style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                            fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                                        ),
                                                        ),
                                                        ),
                                                        Text('${snapshot.data![index].account_no}',style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                            fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                                        ),
                                                        ),
                                                        ),
                                                        Text('${snapshot.data![index].aadhar_card}',style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                                            fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white
                                                        ),
                                                        ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                    ));
                          },
                          child: Container(
                            height: 70,
                            width: 270,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("assets/home/bg_rank_02.png",)
                                )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    SizedBox(width: 10,),
                                    Text("Bank Name : "+snapshot.data![index].bank_name.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                      fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                    ),
                                    ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 10,),
                                    Text("Account Number : "+snapshot.data![index].account_no.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                      fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                    ),
                                    ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                ) : Center(
                    child:CircularProgressIndicator(color: Colors.red,)
                );
              }
          ),
        ),
      ],
    ),
  );

  Future<List<Alb>> bowe() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    final response = await http.get(
      Uri.parse(Apiconstant.baseurl+'account_get?user_id=$value'),
    );
    print(Apiconstant.baseurl+'account_get?user_id=$value');
    final jsond = json.decode(response.body)["country"];
    print(jsond);
    List<Alb> allround = [];
    for (var o in jsond)  {
      Alb al = Alb(
        o["id"],
        o["user_id"],
        o["account_no"],
        o["ifsc"],
        o["micr"],
        o["branch"],
        o["bank_name"],
        o["upi"],
        o["pan"],
        o["aadhar_card"],
      );

      allround.add(al);
    }
    return allround;
  }
}
class Alb {
  String? id;
  String? user_id;
  String? account_no;
  String? ifsc;
  String? micr;
  String? branch;
  String? bank_name;
  String? upi;
  String? pan;
  String? aadhar_card;

  Alb(this.id,
      this.user_id,
      this.account_no,
      this.ifsc,
      this.micr,
      this.branch,
      this.bank_name,
      this.upi,
      this.pan,
      this.aadhar_card,
      );

}