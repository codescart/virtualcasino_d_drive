import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtualcasino/HomeDirectory/NewHome.dart';
import 'package:virtualcasino/Login_directory/Login_Page.dart';
import 'package:virtualcasino/Login_directory/Sign_UP.dart';
import 'package:virtualcasino/roulette/CasinoBoard.dart';
import 'package:virtualcasino/roulette/RoulleteHome.dart';
import 'package:virtualcasino/sound.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]).then((_){
    runApp(MyApp());
  });

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:
      //RouletteLayout()
      //Sound()
     Login(),
    );
  }
}


