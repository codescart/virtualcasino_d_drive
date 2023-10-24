import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualcasino/HomeDirectory/NewHome.dart';
import 'package:http/http.dart' as http;
import 'package:virtualcasino/constant/apihelper.dart';
import 'package:image_picker/image_picker.dart';

class Profile_update extends StatefulWidget {
  const Profile_update({super.key});

  @override
  State<Profile_update> createState() => _LoginState();
}

class _LoginState extends State<Profile_update> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController aadhar = TextEditingController();
  TextEditingController pin = TextEditingController();
  TextEditingController pan = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController mobile = TextEditingController();
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
        body:SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
    // color: Colors.red,
    image: DecorationImage(
    image: AssetImage('assets/home/loadbg.png',),fit: BoxFit.fill,
    )
    ),
            child:  Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width * 0.5,

                decoration: BoxDecoration(
              // color: Colors.red,
              image: DecorationImage(
              image: AssetImage('assets/home/bg_mail.png',),fit: BoxFit.fill,
              )
          ),
                // width: 340,
                padding:  EdgeInsets.only(left: 5.0, right: 5.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(),
                          Text("Update Profile",style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                          ),
                          ),
                          ),
                           InkWell(
                             onTap: (){
                               Navigator.pop(context);
                             },
                               child: Icon(Icons.close_rounded))

                        ],
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          sound();
                          _choosee();
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                              image: DecorationImage(
                                image: AssetImage('assets/home/vip15.png',),fit: BoxFit.fill,
                              )
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 40,
                            child: Container(
                              height: 60,
                              width: 60,
                              child: ClipOval(
                                child: (filee != null)
                                    ? Image.file(filee!,fit: BoxFit.fill,)
                                    : Icon(Icons.camera),
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: name,
                        keyboardType: TextInputType.name,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: const Color(0xFF075E54),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 13.0),
                          prefixIcon: Icon(Icons.person,color: Colors.white,),
                          border: InputBorder.none,
                          hintText: 'Name',
                          hintStyle: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                          ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: aadhar,
                        // maxLength: 2,
                        keyboardType: TextInputType.number,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: const Color(0xFF075E54),
                        decoration: InputDecoration(
                          // counterText: "",
                          contentPadding: const EdgeInsets.only(bottom: 13.0),
                          prefixIcon:Icon(Icons.credit_card,color: Colors.white,),
                          border: InputBorder.none,
                          hintText: 'Addhar Card',
                          hintStyle: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                          ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: pin,
                        // maxLength: 2,
                        keyboardType: TextInputType.name,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: const Color(0xFF075E54),
                        decoration: InputDecoration(
                          counterText: "",
                          contentPadding: const EdgeInsets.only(bottom: 13.0),
                          prefixIcon:  Icon(Icons.password,color: Colors.white,),
                          border: InputBorder.none,
                          hintText: 'Pin',
                          hintStyle: GoogleFonts.playfairDisplay( textStyle:  TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                          ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: pan,
                        keyboardType: TextInputType.name,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: const Color(0xFF075E54),
                        decoration: InputDecoration(
                          counterText: "",
                          contentPadding: const EdgeInsets.only(bottom: 13.0),
                          prefixIcon:Icon(Icons.credit_card,color: Colors.white,),
                          border: InputBorder.none,
                          hintText: 'Pan',
                          hintStyle: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                          ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: age,
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: const Color(0xFF075E54),
                        decoration: InputDecoration(
                          counterText: "",
                          contentPadding: const EdgeInsets.only(bottom: 13.0),
                          prefixIcon:Icon(Icons.height,color: Colors.white,),
                          border: InputBorder.none,
                          hintText: 'Age',
                          hintStyle: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                          ),
                          ),
                        ),
                      ),
                      TextFormField(
                        maxLength: 10,
                        controller: mobile,
                        keyboardType: TextInputType.number,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: const Color(0xFF075E54),
                        decoration: InputDecoration(
                          counterText: "",
                          contentPadding: const EdgeInsets.only(bottom: 13.0),
                          prefixIcon:Icon(Icons.phone,color: Colors.white,),
                          border: InputBorder.none,
                          hintText: 'Mobile',
                          hintStyle: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                              fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white
                          ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          sound();
                          profileupdate(name.text, aadhar.text, pin.text,pan.text,age.text,mobile.text,);
                        },

                        child: Container(
                          height: 35,
                          width: 150,
                        decoration: BoxDecoration(
                          // color: Colors.red,
                            image: DecorationImage(
                              image: AssetImage('assets/home/btn_sort_0.png',),fit: BoxFit.fill,
                            )
                        ),

                          child: Center(
                            child: Text('Update Profile',
                              style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                                  fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white
                              ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            ),
          )
        ),
      ),
    );
  }

  profileupdate(String name,String aadhar,  String pin, String pan,String age,String mobile) async {
    // final prefs = await SharedPreferences.getInstance();
    // final vals = prefs.getString('id') ?? "0";
    // final mobile = prefs.getString('mobile') ?? "0";
    // print(vals);
    final prefs = await SharedPreferences.getInstance();
    final key = 'user_id';
    final value = prefs.getString(key) ?? "0";
    print("hii");
    print("vvvvvvvvv");
    var stream = http.ByteStream(filee!.openRead());
    stream.cast();
    var length = await filee!.length();
    var uri = Uri.parse(Apiconstant.baseurl + "update_profile");
    var request = http.MultipartRequest('POST', uri);
    request.fields['name'] = name;
    request.fields['aadhar'] = aadhar;
    request.fields['pin'] = pin;
    request.fields['pan'] = pan;
    request.fields['age'] = age;
    request.fields["mobile"] = mobile;
    request.fields["id"] = "$value";
    var multiport = http.MultipartFile('photo', stream, length,
        filename: (filee!.path));
    request.files.add(multiport);
    var response = await request.send();
    print(response);

    if (response.statusCode == 200) {
      SharedPreferences prefsss = await SharedPreferences.getInstance();
      await prefsss.setString('action', name);
      print("aaaaaaaaaa");
      print("Aryaman");
    } else {
      print("Something Missing");
    }
  }

  File? filee;
  final pickerr = ImagePicker();

  void _choosee() async {
    final pickedFile = await pickerr.getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        filee = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  // Column(
  // children: [
  //
  // Form(
  // key: _formkey,
  // child: Container(
  // height: MediaQuery.of(context).size.height,
  // decoration: BoxDecoration(
  // gradient: LinearGradient(
  // begin: Alignment.topLeft,
  // end: Alignment.bottomRight,
  // colors: [
  // Color(0xff570000),
  // Color(0xff8d0303),
  // Color(0xffcc0707),
  // Color(0xffea0909),
  // ],
  // ),
  // borderRadius: BorderRadius.circular(30),
  // boxShadow: [
  // BoxShadow(
  // blurRadius: 25.0,
  // ),
  // ],
  // ),
  // width: 340,
  // padding: const EdgeInsets.only(left: 5.0, right: 15.0),
  // child: Column(
  // children: [
  // TextFormField(
  // controller: aadhar,
  // keyboardType: TextInputType.name,
  // textAlignVertical: TextAlignVertical.bottom,
  // style: const TextStyle(color: Colors.white),
  // cursorColor: const Color(0xFF075E54),
  // decoration: InputDecoration(
  // contentPadding: const EdgeInsets.only(bottom: 13.0),
  // prefixIcon: Icon(Icons.person,color: Colors.white,),
  // border: InputBorder.none,
  // hintText: 'Aadhar Card',
  // hintStyle: TextStyle(
  // color: Colors.grey[400],
  // fontSize: 20,
  // ),
  // ),
  // ),
  // TextFormField(
  // controller: name,
  // keyboardType: TextInputType.name,
  // textAlignVertical: TextAlignVertical.bottom,
  // style: const TextStyle(color: Colors.white),
  // cursorColor: const Color(0xFF075E54),
  // decoration: InputDecoration(
  // // counterText: "",
  // contentPadding: const EdgeInsets.only(bottom: 13.0),
  // prefixIcon:Icon(Icons.pin,color: Colors.white,),
  // border: InputBorder.none,
  // hintText: 'Name',
  // hintStyle: TextStyle(
  // color: Colors.grey[400],
  // fontSize: 20,
  // ),
  // ),
  // ),
  // TextFormField(
  // controller: pin,
  // // maxLength: 2,
  // keyboardType: TextInputType.name,
  // textAlignVertical: TextAlignVertical.bottom,
  // style: const TextStyle(color: Colors.white),
  // cursorColor: const Color(0xFF075E54),
  // decoration: InputDecoration(
  // counterText: "",
  // contentPadding: const EdgeInsets.only(bottom: 13.0),
  // prefixIcon:Icon(Icons.comment_bank,color: Colors.white,),
  // border: InputBorder.none,
  // hintText: 'Pin',
  // hintStyle: TextStyle(
  // color: Colors.grey[400],
  // fontSize: 20,
  // ),
  // ),
  // ),
  // TextFormField(
  // controller: pan,
  // keyboardType: TextInputType.number,
  // textAlignVertical: TextAlignVertical.bottom,
  // style: const TextStyle(color: Colors.white),
  // cursorColor: const Color(0xFF075E54),
  // decoration: InputDecoration(
  // counterText: "",
  // contentPadding: const EdgeInsets.only(bottom: 13.0),
  // prefixIcon:Icon(Icons.height,color: Colors.white,),
  // border: InputBorder.none,
  // hintText: 'Pan Card',
  // hintStyle: TextStyle(
  // color: Colors.grey[400],
  // fontSize: 20,
  // ),
  // ),
  // ),
  // TextFormField(
  // controller: age,
  // maxLength: 2,
  // keyboardType: TextInputType.number,
  // textAlignVertical: TextAlignVertical.bottom,
  // style: const TextStyle(color: Colors.white),
  // cursorColor: const Color(0xFF075E54),
  // decoration: InputDecoration(
  // counterText: "",
  // contentPadding: const EdgeInsets.only(bottom: 13.0),
  // prefixIcon:Icon(Icons.password,color: Colors.white,),
  // border: InputBorder.none,
  // hintText: 'Age',
  // hintStyle: TextStyle(
  // color: Colors.grey[400],
  // fontSize: 20,
  // ),
  // ),
  // ),
  // TextFormField(
  // controller: mobile,
  // maxLength: 10,
  // keyboardType: TextInputType.number,
  // textAlignVertical: TextAlignVertical.bottom,
  // style: const TextStyle(color: Colors.white),
  // cursorColor: const Color(0xFF075E54),
  // decoration: InputDecoration(
  // counterText: "",
  // contentPadding: const EdgeInsets.only(bottom: 13.0),
  // prefixIcon:Icon(Icons.people,color: Colors.white,),
  // border: InputBorder.none,
  // hintText: 'Mobile Number',
  // hintStyle: TextStyle(
  // color: Colors.grey[400],
  // fontSize: 20,
  // ),
  // ),
  // ),
  //
  // ElevatedButton(onPressed: (){
  // profileupdate(aadhar.text,name.text,pin.text,pan.text,age.text,mobile.text);
  // }, child: Text('Update Profile'))
  // ],
  // ),
  // ),
  // )
  // ],
  // )
}