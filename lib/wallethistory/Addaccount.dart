// import 'dart:convert';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gif/flutter_gif.dart';
// import 'package:virtualcasino/HomeDirectory/NewHome.dart';
// import 'package:http/http.dart' as http;
// import 'package:virtualcasino/constant/apihelper.dart';
//
// class Add_Account extends StatefulWidget {
//   const Add_Account({super.key});
//
//   @override
//   State<Add_Account> createState() => _LoginState();
// }
//
// class _LoginState extends State<Add_Account> {
//
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//   TextEditingController upi = TextEditingController();
//   TextEditingController accountno = TextEditingController();
//   TextEditingController pan = TextEditingController();
//   TextEditingController aadharcard = TextEditingController();
//   TextEditingController ifsc = TextEditingController();
//   TextEditingController micr = TextEditingController();
//   TextEditingController bankname = TextEditingController();
//   TextEditingController branch = TextEditingController();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           CachedNetworkImage(
//             imageUrl: Apiconstant.gifurl + "login.gif",
//             imageBuilder: (context, imageProvider) => Container(
//               height: 35,
//               width: 35,
//               decoration: BoxDecoration(
//                   color: Colors.red,
//                   image: DecorationImage(
//                     image: imageProvider,fit: BoxFit.fill,
//                   )
//               ),
//               // gaplessPlayback: false,
//             ),
//
//             placeholder: (context, url) => Icon(Icons.account_circle, size:15),
//             errorWidget: (context, url, error) => Icon(Icons.error),
//           ),
//
//           Positioned(
//               top: MediaQuery.of(context).size.height*0.02,
//               left: MediaQuery.of(context).size.width*0.3,
//               child: Column(
//                 children: [
//                   Form(
//                     key: _formkey,
//                     child: Container(
//                       height: MediaQuery.of(context).size.height,
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                           colors: [
//                             Color(0xff570000),
//                             Color(0xff8d0303),
//                             Color(0xffcc0707),
//                             Color(0xffea0909),
//                           ],
//                         ),
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: [
//                           BoxShadow(
//                             blurRadius: 25.0,
//                           ),
//                         ],
//                       ),
//                       width: 340,
//                       padding: const EdgeInsets.only(left: 5.0, right: 15.0),
//                       child: Column(
//                         children: [
//                           TextFormField(
//                             controller: upi,
//                             keyboardType: TextInputType.name,
//                             textAlignVertical: TextAlignVertical.bottom,
//                             style: const TextStyle(color: Colors.white),
//                             cursorColor: const Color(0xFF075E54),
//                             decoration: InputDecoration(
//                               contentPadding: const EdgeInsets.only(bottom: 13.0),
//                               prefixIcon: Icon(Icons.person,color: Colors.white,),
//                               border: InputBorder.none,
//                               hintText: 'Upi',
//                               hintStyle: TextStyle(
//                                 color: Colors.grey[400],
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ),
//                           TextFormField(
//                             controller: accountno,
//                             // maxLength: 2,
//                             keyboardType: TextInputType.number,
//                             textAlignVertical: TextAlignVertical.bottom,
//                             style: const TextStyle(color: Colors.white),
//                             cursorColor: const Color(0xFF075E54),
//                             decoration: InputDecoration(
//                               // counterText: "",
//                               contentPadding: const EdgeInsets.only(bottom: 13.0),
//                               prefixIcon:Icon(Icons.pin,color: Colors.white,),
//
//                               border: InputBorder.none,
//                               hintText: 'Account no.',
//                               hintStyle: TextStyle(
//                                 color: Colors.grey[400],
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ),
//                           TextFormField(
//                             controller: pan,
//                             // maxLength: 2,
//                             keyboardType: TextInputType.name,
//                             textAlignVertical: TextAlignVertical.bottom,
//                             style: const TextStyle(color: Colors.white),
//                             cursorColor: const Color(0xFF075E54),
//                             decoration: InputDecoration(
//                               counterText: "",
//                               contentPadding: const EdgeInsets.only(bottom: 13.0),
//                               prefixIcon:Icon(Icons.comment_bank,color: Colors.white,),
//                               border: InputBorder.none,
//                               hintText: 'Pan Card',
//                               hintStyle: TextStyle(
//                                 color: Colors.grey[400],
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ),
//                           TextFormField(
//                             controller: aadharcard,
//                             keyboardType: TextInputType.number,
//                             textAlignVertical: TextAlignVertical.bottom,
//                             style: const TextStyle(color: Colors.white),
//                             cursorColor: const Color(0xFF075E54),
//                             decoration: InputDecoration(
//                               counterText: "",
//                               contentPadding: const EdgeInsets.only(bottom: 13.0),
//                               prefixIcon:Icon(Icons.height,color: Colors.white,),
//                               border: InputBorder.none,
//                               hintText: 'Age',
//                               hintStyle: TextStyle(
//                                 color: Colors.grey[400],
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ),
//                           TextFormField(
//                             controller: ifsc,
//                             keyboardType: TextInputType.number,
//                             textAlignVertical: TextAlignVertical.bottom,
//                             style: const TextStyle(color: Colors.white),
//                             cursorColor: const Color(0xFF075E54),
//                             decoration: InputDecoration(
//                               counterText: "",
//                               contentPadding: const EdgeInsets.only(bottom: 13.0),
//                               prefixIcon:Icon(Icons.password,color: Colors.white,),
//                               border: InputBorder.none,
//                               hintText: 'IFSC',
//                               hintStyle: TextStyle(
//                                 color: Colors.grey[400],
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ),
//                           TextFormField(
//                             controller: micr,
//                             keyboardType: TextInputType.name,
//                             textAlignVertical: TextAlignVertical.bottom,
//                             style: const TextStyle(color: Colors.white),
//                             cursorColor: const Color(0xFF075E54),
//                             decoration: InputDecoration(
//                               counterText: "",
//                               contentPadding: const EdgeInsets.only(bottom: 13.0),
//                               prefixIcon:Icon(Icons.people,color: Colors.white,),
//                               border: InputBorder.none,
//                               hintText: 'Micr',
//                               hintStyle: TextStyle(
//                                 color: Colors.grey[400],
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ),
//                           TextFormField(
//                             controller: bankname,
//                             keyboardType: TextInputType.name,
//                             textAlignVertical: TextAlignVertical.bottom,
//                             style: const TextStyle(color: Colors.white),
//                             cursorColor: const Color(0xFF075E54),
//                             decoration: InputDecoration(
//                               counterText: "",
//                               contentPadding: const EdgeInsets.only(bottom: 13.0),
//                               prefixIcon:Icon(Icons.account_balance,color: Colors.white,),
//                               border: InputBorder.none,
//                               hintText: 'Bank Name',
//                               hintStyle: TextStyle(
//                                 color: Colors.grey[400],
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ),
//                           TextFormField(
//                             controller: branch,
//                             keyboardType: TextInputType.name,
//                             textAlignVertical: TextAlignVertical.bottom,
//                             style: const TextStyle(color: Colors.white),
//                             cursorColor: const Color(0xFF075E54),
//                             decoration: InputDecoration(
//                               counterText: "",
//                               contentPadding: const EdgeInsets.only(bottom: 13.0),
//                               prefixIcon:Icon(Icons.pin_drop,color: Colors.white,),
//                               border: InputBorder.none,
//                               hintText: 'Branch',
//                               hintStyle: TextStyle(
//                                 color: Colors.grey[400],
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ),
//                           ElevatedButton(onPressed: (){
//                             signup(upi.text, accountno.text, pan.text,aadharcard.text,ifsc.text,micr.text,bankname.text,branch.text);
//                           }, child: Text('Add Account'),)
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ))
//         ],
//       ),
//     );
//   }
//   signup(String upi,String account_no,String pan,String aadhar_card,String ifsc,String micr,String bank_name,String branch,)async {
//     final response = await http.post(
//       Uri.parse(
//           Apiconstant.baseurl + "add_account"),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         "upi":upi,
//         "account_no":account_no,
//         "pan":pan,
//         "aadhar_card":aadhar_card,
//         "ifsc":ifsc,
//         "micr":micr,
//         "bank_name":bank_name,
//         "branch":branch,
//         "user_id" : "1",
//       }),
//     );
//     final data = jsonDecode(response.body);
//     print(data);
//     if (data['error'] == "200") {
//       // final otp=data['otp'];
//       // final prefs1 = await SharedPreferences.getInstance();
//       // final key1 = 'user_id';
//       // final mobile = data['data']['id'] ;
//       // prefs1.setString(key1, mobile);
//
//       print(" Addacount SucessFully");
//       // Navigator.push(context, MaterialPageRoute(builder: (context)=> NewHomePage()));
//     } else {
//       // signup();
//       print("not regisdterd");
//     }
//   }
//
//
// }