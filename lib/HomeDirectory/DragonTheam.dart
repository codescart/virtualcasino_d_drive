import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:virtualcasino/customappbar/customappbar.dart';

class DragonTheam extends StatefulWidget {
  const DragonTheam({super.key});
  @override
  State<DragonTheam> createState() => _DragonTheamState();
}

class _DragonTheamState extends State<DragonTheam> {
  @override
  Widget build(BuildContext context) {
    return
      // appBar: CustomAppBarTwo(),
    Stack(
        clipBehavior: Clip.none,
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 10),
            child: Container(

              height: MediaQuery.of(context).size.height*0.45,
              width: MediaQuery.of(context).size.height*0.22,

            ),
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height*0.04,
            left: -MediaQuery.of(context).size.height*0.00002,

            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/home/gameiconImg_145.png',),fit: BoxFit.fill,
                  )
              ),
              child:Center(child: Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: GradientText(
                    '',
                    style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                        fontSize: 15.0,fontWeight: FontWeight.bold
                    ),
                    ),
                    gradientType: GradientType.linear,
                    gradientDirection: GradientDirection.ttb,
                    radius: .4,
                    colors: [
                      Color(0xffec5500),
                      Colors.black,
                    ],
                  )
              )),

              // Image.asset('assets/new/ribon.png')
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height*0.01,
            right: -MediaQuery.of(context).size.height*0.065,
            child: Container(
              height: 200,
              width: 200,
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage('assets/new/tiger.gif',),fit: BoxFit.fill,
              //     )
              // ),
              child:Center(child: Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: GradientText(
                    '',
                    style: GoogleFonts.playfairDisplay( textStyle:TextStyle(
                        fontSize: 15.0,fontWeight: FontWeight.bold
                    ),
                    ),
                    gradientType: GradientType.linear,
                    gradientDirection: GradientDirection.ttb,
                    radius: .4,
                    colors: [
                      Color(0xffec5500),
                      Colors.black,
                    ],
                  )
              )),

              // Image.asset('assets/new/ribon.png')
            ),
          ),
        ],
    );
  }
}
