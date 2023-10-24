import 'package:flutter/material.dart';
import 'package:virtualcasino/triplefun/GridData.dart';





class Tripal_fun_TabBar extends StatefulWidget {
  @override
  _Tripal_fun_TabBarState createState() => new _Tripal_fun_TabBarState();
}

class _Tripal_fun_TabBarState extends State<Tripal_fun_TabBar> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 10, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Column(
        children: <Widget>[
          DefaultTabController(
              length: 10, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                Container(

                  child: TabBar(
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.black,

                    tabs: [
                      Tab( text: "0",),
                      Tab(text: "1"),
                      Tab(text: "2"),
                      Tab( text: "3"),
                      Tab(text: "4"),
                      Tab( text: "5"),
                      Tab( text: "6"),
                      Tab( text: "7"),
                      Tab(text: "8"),
                      Tab( text: "9")
                    ],
                  ),
                ),
                Container(
                  height: 140.0,
                  child: new TabBarView(
                    controller: _controller,
                    children: <Widget>[
                      GridData(nums:'0'),
                      GridData(nums:'1'),
                      GridData(nums:'2'),
                      GridData(nums:'3'),
                      GridData(nums:'4'),
                      GridData(nums:'5'),
                      GridData(nums:'6'),
                      GridData(nums:'7'),
                      GridData(nums:'8'),
                      GridData(nums:'9'),
                    ],
                  ),
                ),
              ])
          ),

        ],
      ),
    );
  }
}