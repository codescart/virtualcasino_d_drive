import 'package:flutter/material.dart';

class Appbar extends StatefulWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AppBar(
        leading: Image.asset('assets/roulette/frame.png'),
        title: Container(
          height: MediaQuery.of(context).size.height*0.15,
          child: Row(
            children: [
              Image.asset('assets/home/avtar.gif'),
              Column(
                children: [
                  Text('name'),
                  Text('ID:01511'),
                ],
              ),

              Container(
                child: Row(

                  children: [

                    Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                        child: Image.asset('assets/home/coins.png',
                          height: 30,
                          width: 30,
                        )
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height*0.12,
                        width: MediaQuery.of(context).size.width*0.13,
                        child: Center(
                          child: Text('2000000',

                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xffdc9545)
                            ),
                          ),
                        )
                    ),
                    InkWell(
                      onTap: (){
                      },
                      child: CircleAvatar(
                          radius: 15,
                          child:  Icon(Icons.repeat_one, color: Colors.black,)),

                    )
                  ],
                ),
              )
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.info_outline)),
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.volume_up))
        ],

      ),
    );
  }
}
