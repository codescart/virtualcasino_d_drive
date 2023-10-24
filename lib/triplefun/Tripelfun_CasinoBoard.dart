import 'package:flutter/material.dart';
import 'package:virtualcasino/triplefun/GridData.dart';
import 'package:virtualcasino/triplefun/TripleFunGrid.dart';
import 'package:virtualcasino/triplefun/spinwheelscreen.dart';
import 'package:virtualcasino/triplefun/tab_test.dart';



class Tripelfun_CasinoBoard extends StatefulWidget {
  const Tripelfun_CasinoBoard({Key? key}) : super(key: key);

  @override
  State<Tripelfun_CasinoBoard> createState() => _Tripelfun_CasinoBoardState();
}

class _Tripelfun_CasinoBoardState extends State<Tripelfun_CasinoBoard> {

  static const List data= <String>["00","01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99"];
  static const List batval= <String>['1','5','10','50','100','500','1000','5000'];
  static const List colord= <Color>[Color(0xff009316), Color(0xff0741d0), Color(0xff6c0303), Color(0xffd9b149), Color(0xff069a7f), Color(0xffbb1a82),
    Color(0xff9d4303), Color(0xff6581f8)
  ];


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(),


      ],
    );
  }
}

