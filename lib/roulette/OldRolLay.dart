import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RouletteLayout extends StatefulWidget {
  const RouletteLayout({Key? key}) : super(key: key);

  @override
  State<RouletteLayout> createState() => _RouletteLayoutState();
}

class _RouletteLayoutState extends State<RouletteLayout> {

  static const List data= <int>[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36];
  final red = {1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36};
  static const List batval= <String>['1','5','10','50','100','500','1000','5000'];
  static const List colord= <Color>[Color(0xff009316), Color(0xff0741d0), Color(0xff6c0303), Color(0xffd9b149), Color(0xff069a7f), Color(0xffbb1a82),
    Color(0xff9d4303), Color(0xff6581f8)
  ];

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
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.0393,right: MediaQuery.of(context).size.width*0.0393,),
          child: Container(

            decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffffd700),
                  width: 1,
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.325,
                    width: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffffd700),
                          width: 1,
                        )
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height* 0.085, left: 1.5, right: 1.5, bottom: MediaQuery.of(context).size.height* 0.085),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffffd700),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(50))
                        ),

                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 15,
                          child: Text(0.toString()),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.325,
                  width: MediaQuery.of(context).size.width*0.73,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            sound();
                            showDialog(
                                context: context,
                                builder: (ctx) =>

                                    AlertDialog(
                                      backgroundColor: Colors.transparent,
                                      title: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xffffd700),
                                                width: 4,
                                              ),
                                              color: Colors.black,
                                              borderRadius: BorderRadius.all(Radius.circular(50))
                                          ),
                                          child: Center(child: Text('Bet On :  '+data[index].toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),))),
                                      content: Container(
                                        height: 150,
                                        width: 220,
                                        child: GridView.builder(
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 4),
                                            itemCount: batval.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              return InkWell(
                                                child: Padding(
                                                  padding: EdgeInsets.all(2),
                                                  child: Container(

                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Color(0xffffd700),
                                                          width: 4,
                                                        ),
                                                        borderRadius: BorderRadius.all(Radius.circular(50))
                                                    ),

                                                    child: CircleAvatar(
                                                      backgroundColor: colord[index],
                                                      radius: 10,
                                                      child: Text(batval[index].toString()),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                        ),
                                      ),
                                    ));


                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffffd700),
                                  width: 1,
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2),
                              child: Container(

                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xffffd700),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(50))
                                ),

                                child: CircleAvatar(
                                  backgroundColor: data[index]==1? Color(0xffb20909)
                                      :data[index]== 3? Color(0xffb20909) :data[index]== 5? Color(0xffb20909) :data[index]== 7? Color(0xffb20909) :data[index]== 9? Color(0xffb20909) :data[index]== 12? Color(0xffb20909) :data[index]== 14? Color(0xffb20909) :data[index]== 16? Color(0xffb20909) :data[index]== 18? Color(0xffb20909) :data[index]== 19? Color(0xffb20909) :data[index]== 21? Color(0xffb20909) :data[index]== 23? Color(0xffb20909) :data[index]== 25? Color(0xffb20909) :data[index]== 27? Color(0xffb20909) :data[index]== 30? Color(0xffb20909) :data[index]== 32? Color(0xffb20909) :data[index]== 34? Color(0xffb20909) :data[index]== 36? Color(0xffb20909):Colors.black,
                                  radius: 15,
                                  child: Text(data[index].toString()),
                                ),
                              ),
                            ),
                          ),
                        ) ;
                      }),
                ),
                Container(

                  height: MediaQuery.of(context).size.height*0.325,
                  width: 60,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffffd700),
                        width: 1,
                      )
                  ),
                  // child:
                  //Padding(
                  // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height* 0.085, left: 1.5, right: 1.5, bottom: MediaQuery.of(context).size.height* 0.085),
                  child: Container(
                    child: Column(
                      children: [
                        Container(

                          child: Text('2\nTO\n1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
                          // child: CircleAvatar(
                          //   backgroundColor: Colors.green,
                          //   radius: 15,
                          //   child: Text(0.toString()),
                          // ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 1),
                          child: Container(

                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffffd700),
                                  width: 1,
                                ),
                                // borderRadius: BorderRadius.all(Radius.circular(50))
                              )),
                        ),
                        Container(

                          child: Text('2\nTO\n1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),

                          // child: CircleAvatar(
                          //   backgroundColor: Colors.green,
                          //   radius: 15,
                          //   child: Text(0.toString()),
                          // ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 1),
                          child: Container(

                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffffd700),
                                  width: 1,
                                ),
                                // borderRadius: BorderRadius.all(Radius.circular(50))
                              )),
                        ),


                        Container(


                          child: Text('2\nTO\n1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),

                          // child: CircleAvatar(
                          //   backgroundColor: Colors.green,
                          //   radius: 15,
                          //   child: Text(0.toString()),
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ),
              ],
            ),
          ),
        ),
        Container(

          width: MediaQuery.of(context).size.width*0.73,

          decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffffd700),
                width: 1,
              )
          ),
          // child:
          //Padding(
          // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height* 0.085, left: 1.5, right: 1.5, bottom: MediaQuery.of(context).size.height* 0.085),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.2422,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffffd700),
                      width: 1,
                    ),
                    // borderRadius: BorderRadius.all(Radius.circular(50))
                  ),

                  child: Center(child: Text('1st 12', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
                  // child: CircleAvatar(
                  //   backgroundColor: Colors.green,
                  //   radius: 15,
                  //   child: Text(0.toString()),
                  // ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.2422,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffffd700),
                      width: 1,
                    ),
                    // borderRadius: BorderRadius.all(Radius.circular(50))
                  ),

                  child: Center(child: Text('2nd 12', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
                  // child: CircleAvatar(
                  //   backgroundColor: Colors.green,
                  //   radius: 15,
                  //   child: Text(0.toString()),
                  // ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.2422,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffffd700),
                      width: 1,
                    ),
                    // borderRadius: BorderRadius.all(Radius.circular(50))
                  ),

                  child: Center(child: Text('3rd 12', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
                  // child: CircleAvatar(
                  //   backgroundColor: Colors.green,
                  //   radius: 15,
                  //   child: Text(0.toString()),
                  // ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}