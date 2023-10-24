import 'package:flutter/material.dart';
import 'package:virtualcasino/roulette/casino.dart';

class RouletUpper extends StatefulWidget {
  const RouletUpper({Key? key}) : super(key: key);

  @override
  State<RouletUpper> createState() => _RouletUpperState();
}

class _RouletUpperState extends State<RouletUpper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LeftBoard(),

          RightBoard()
        ],
      ),
    );
  }
}

class LeftBoard extends StatefulWidget {
  const LeftBoard({Key? key}) : super(key: key);

  @override
  State<LeftBoard> createState() => _LeftBoardState();
}

class _LeftBoardState extends State<LeftBoard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 120,
          width: 30,
          decoration: BoxDecoration(
              color: Colors.black,

              borderRadius: BorderRadius.all(Radius.circular(50)),

              border: Border.all(
                color: Color(0xffffd700),
                width: 2 ,
              )),

        ),
        SizedBox(width: 10,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Center(child: Text('Score', style: TextStyle(fontWeight: FontWeight.bold, color:Color(0xffffd700)),)),
            Container(
                padding: EdgeInsets.only(left: 50, right: 50,top: 2, bottom: 2),

                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffffd700),
                      width: 2 ,
                    ),
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                child: Center(child: Text('5615145', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),))),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            Container(
                padding: EdgeInsets.only(left: 50, right: 50,top: 2, bottom: 2),

                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffffd700),
                      width: 2 ,
                    ),
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                child: Center(child: Text('5615145', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),))),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            InkWell(
              child: Container(
                  padding: EdgeInsets.only(left: 30, right: 30,top: 2, bottom: 2),

                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffffd700),
                        width: 2 ,
                      ),
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  child: Center(child: Text('Cancel Specific Bet', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10),))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.015,
            ),
          ],
        ),
      ],
    );
  }
}


class RightBoard extends StatefulWidget {
  const RightBoard({Key? key}) : super(key: key);

  @override
  State<RightBoard> createState() => _RightBoardState();
}

class _RightBoardState extends State<RightBoard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(child: Text('Winner', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffffd700), fontSize: 15),)),
        Container(
          padding: EdgeInsets.only(left: 50, right: 50,top: 2, bottom: 2),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffffd700),
                  width: 2,
                ),
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(50))
            ),
            child: Center(child: Text('5615145', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),))),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.05,
        ),
        Container(
            padding: EdgeInsets.only(left: 50, right: 50,top: 2, bottom: 2),

            decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffffd700),
                  width: 2 ,
                ),
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(50))
            ),
            child: Center(child: Text('5615145', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),))),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.03,
        ),
        Row(
          children: [
            InkWell(
              child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10,top: 2, bottom: 2),

                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffffd700),
                        width: 2 ,
                      ),
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  child: Center(child: Text('Cancel Bet', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10),))),
            ),
            SizedBox(width: 20,),
            InkWell(
              child: Container(
                  padding: EdgeInsets.only(left: 10, right: 20,top: 2, bottom: 2),

                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffffd700),
                        width: 2 ,
                      ),
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  child: Center(child: Text('Bet Ok', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10),))),
            ),

          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.035,
        ),
      ],
    );
  }
}

