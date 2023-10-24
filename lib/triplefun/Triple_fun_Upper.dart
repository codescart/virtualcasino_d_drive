import 'package:flutter/material.dart';

class Triple_fun_Upper extends StatefulWidget {
  const Triple_fun_Upper({Key? key}) : super(key: key);

  @override
  State<Triple_fun_Upper> createState() => _Triple_fun_UpperState();
}

class _Triple_fun_UpperState extends State<Triple_fun_Upper> {
  @override
  Widget build(BuildContext context) {
      return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(

                  child: Column(
                    children: [


                    ],
                  ),
                ),

                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 30,
                              padding: EdgeInsets.only(left: 10, right: 10,top: 2, bottom: 2),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/fun/b.png'),
                                    fit: BoxFit.fill
                                ),
                              ),
                              child: Center(child: Text('Last 5 - 25|86|12|65|68', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 10),))),
                          Center(child: Text('Winner',
                            style: TextStyle(fontWeight: FontWeight.bold,
                                color:Color(0xffffd700)),)),
                        ],
                      ),

                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 80,
                            padding: EdgeInsets.only(left: 10, right: 10,top: 2, bottom: 2),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/fun/triple.png'),
                                  fit: BoxFit.fill
                              ),

                            ),
                          ),
                          Container(
                              height: 30,
                              padding: EdgeInsets.only(left: 10, right: 10,top: 2, bottom: 2),

                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/fun/b.png'),
                                    fit: BoxFit.fill
                                ),

                              ),
                              child: Center(child: Text('Last 5 - 25|86|12|65|68', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 10),))),
                        ],
                      ),

                    ],
                  ),
                ),

              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Container(
            //         height: 50,
            //         width: 180,
            //         padding: EdgeInsets.only(left: 10, right: 10,top: 5, bottom: 5),
            //
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //               image: AssetImage('assets/fun/button2.png'),
            //               fit: BoxFit.fill
            //           ),
            //
            //         ),
            //         child: Center(child: Padding(
            //           padding: const EdgeInsets.all(3.0),
            //           child: Text('Last 5 - 25|86|12|65|68', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 10),),
            //         ))),
            //     Container(
            //         height: 50,
            //         width: 180,
            //         padding: EdgeInsets.only(left: 10, right: 10,top: 5, bottom: 5),
            //
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //               image: AssetImage('assets/fun/button2.png'),
            //               fit: BoxFit.fill
            //           ),
            //
            //         ),
            //         child: Center(child: Padding(
            //           padding: const EdgeInsets.all(3.0),
            //           child: Text('Last 5 - 25|86|12|65|68', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 10),),
            //         ))),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}



