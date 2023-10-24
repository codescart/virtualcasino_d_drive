import 'package:flutter/material.dart';


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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Center(child: Text('Score', style: TextStyle(fontWeight: FontWeight.bold, color:Color(0xffffd700)),)),
        Container(
            height: 25,
            width: 70,
            padding: EdgeInsets.only(left: 10, right: 10,top: 4, bottom: 4),

            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/fun/b.png'),
                  fit: BoxFit.fill
              ),

            ),
            child: Center(child: Text('5615145', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),))),

        Center(child: Text('Time', style: TextStyle(fontWeight: FontWeight.bold, color:Color(0xffffd700)),)),

        Container(
            height: 25,
            width: 70,
            padding: EdgeInsets.only(left: 10, right: 10,top: 4, bottom: 4),

            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/fun/b.png'),
                  fit: BoxFit.fill
              ),

            ),
            child: Center(child: Text('5615145', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),))),

        InkWell(
          child: Container(
              height: 50,
              width: 150,
              padding: EdgeInsets.only(left: 10, right: 10,top: 4, bottom: 4),

              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/fun/button3.png'),
                    fit: BoxFit.fill
                ),

              ),
              child: Center(child: Text('Take', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellowAccent, fontSize: 10),))),
        ),
        InkWell(
          child: Container(
              height:50,
              width: 150,
              padding: EdgeInsets.only(left: 10, right: 10,top: 2, bottom: 2),

              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/fun/button3.png'),
                    fit: BoxFit.fill
                ),

              ),
              child: Center(child: Text('Cancel Bet', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellowAccent, fontSize: 10),))),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.015,
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
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(child: Text('Winner', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffffd700), fontSize: 15),)),
        Container(
            height: 25,
            width: 150,
            padding: EdgeInsets.only(left: 10, right: 10,top: 4, bottom: 4),

            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/fun/b.png'),
                  fit: BoxFit.fill
              ),

            ),
            child: Center(child: Text('0', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),))),
        Center(child: Text('Last 10 Days', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffffd700), fontSize: 15),)),

        Container(
            height: 25,
            width: 150,
            padding: EdgeInsets.only(left: 10, right: 10,top: 4, bottom: 4),

            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/fun/b.png'),
                  fit: BoxFit.fill
              ),

            ),
            child: Center(child: Text('5 6 1 5 1 4 5 6 9', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),))),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.03,
        ),
        InkWell(
          child: Container(
              height: 50,
              width: 150,
              padding: EdgeInsets.only(left: 10, right: 10,top: 4, bottom: 4),

              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/fun/button3.png'),
                    fit: BoxFit.fill
                ),

              ),
              child: Center(child: Text('Cancle Specfic Bet', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellowAccent, fontSize: 10),))),
        ),
        InkWell(
          child: Container(
              height: 50,
              width: 150,
              padding: EdgeInsets.only(left: 10, right: 10,top: 2, bottom: 2),

              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/fun/button3.png'),
                    fit: BoxFit.fill
                ),

              ),
              child: Center(child: Text('Bet Ok', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellowAccent, fontSize: 15),))),
        ),


      ],
    );
  }
}
