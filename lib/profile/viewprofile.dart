import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualcasino/constant/apihelper.dart';


class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  State<ViewProfile> createState() => _homeState();
}
class _homeState extends State<ViewProfile> {
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
    print('pankaj');
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
        image: AssetImage('assets/home/forget_bg.png'),
      ),
    ),
    child:
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Text("View Profile",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
             fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black
         ),
         ),
         ),
         Container(
           height: 200,
           child: FutureBuilder<List<Alb>>(
               future: bowe(),
               builder: (context, snapshot) {
                 if (snapshot.hasError) print(snapshot.error);
                 return snapshot.hasData
                     ? ListView.builder(
                     itemCount: snapshot.data!.length,
                     itemBuilder: (BuildContext context,int index)=>
                         Container(
                           height: MediaQuery.of(context).size.height ,
                           width: 400,

                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                             children: [


                               SizedBox(height: 10,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                 children: [

                                   Text("Name :  ",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                   Text(snapshot.data![index].full_name.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                 ],
                               ),
                               SizedBox(height: 5,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   Text("Number : ",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                   Text(snapshot.data![index].mobile.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                 ],
                               ),
                               SizedBox(height: 5,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                 children: [
                                   Text("Account : ",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                   Text(snapshot.data![index].accountno_id.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                 ],
                               ),
                               SizedBox(height: 5,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                 children: [
                                   Text("Wallet : ",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                   Text(snapshot.data![index].wallet.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                 ],
                               ),
                               SizedBox(height: 5,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                 children: [
                                   Text("Age : ",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                   Text(snapshot.data![index].age.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                 ],
                               ),
                               SizedBox(height: 5,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                 children: [
                                   Text("Date & Time : ",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                   Text(snapshot.data![index].datetime.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                 ],
                               ),

                               SizedBox(height: 5,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                 children: [
                                   Text("Bonus : ",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                   Text(snapshot.data![index].bonus.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                 ],
                               ),

                               SizedBox(height: 5,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                 children: [
                                   Text("Addhar : ",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                   Text(snapshot.data![index].aadhar.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                 ],
                               ),
                               SizedBox(height: 5,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                 children: [
                                   Text("Refferal code : ",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                   Text(snapshot.data![index].referral_code.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                 ],
                               ),
                               SizedBox(height: 5,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                 children: [
                                   Text("Pin : ",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                   Text(snapshot.data![index].pin.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                 ],
                               ),
                               SizedBox(height: 5,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                 children: [
                                   Text("Pan : ",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
                                   ),
                                   ),
                                   ),
                                   Text(snapshot.data![index].pan.toString(),style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                     fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,
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


  );


  Future<List<Alb>> bowe() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    final response = await http.get(
      Uri.parse(Apiconstant.baseurl+'profile_get?user_id=$value'),
    );

    final jsond = json.decode(response.body)["data"];
    print(jsond);
    List<Alb> allround = [];
    for (var o in jsond)  {
      Alb al = Alb(
        o["id"],
        o["full_name"],
        o["mobile"],
        o["wallet"],
        o["pan"],
        o["upi"],
        o["accountno_id"],
        o["pin"],
        o["photo"],
        o["aadhar"],
        o["referral_code"],
        o["status"],
        o["datetime"],
        o["age"],
        o["bonus"],
      );

      allround.add(al);
    }
    return allround;
  }
}
class Alb {
  String? id;
  String? full_name;
  String? mobile;
  String? wallet;
  String? pan;
  String? upi;
  String? accountno_id;
  String? pin;
  String? photo;
  String? aadhar;
  String? referral_code;
  String? status;
  String? datetime;
  String? age;
  String? bonus;

  Alb(this.id,
      this.full_name,
      this.mobile,
      this.wallet,
      this.pan,
      this.upi,
      this.accountno_id,
      this.pin,
      this.photo,
      this.aadhar,
      this.referral_code,
      this.status,
      this.datetime,
      this.age,
      this.bonus
      );

}