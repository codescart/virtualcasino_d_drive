import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtualcasino/triplefun/GridData.dart';



class report_page extends StatefulWidget {
  // final amount;
  // const report_page({Key? key, required this.amount}) : super(key: key);
  @override
  _report_pageState createState() => _report_pageState();
}

class _report_pageState extends State<report_page> {

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[

          DefaultTabController(
              length: 10, // length of tabs
              initialIndex: 0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Container(
                  child: TabBar(

                      unselectedLabelColor: Colors.redAccent,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      indicator: BoxDecoration(
                          color: Colors.redAccent),
                      tabs: [
                        Tab(child: Text('0',style: TextStyle(fontSize: 7),)),
                        Tab(child: Text('1',style: TextStyle(fontSize: 7),)),
                        Tab(child: Text('2',style: TextStyle(fontSize: 7),)),
                        Tab(child: Text('3',style: TextStyle(fontSize: 7),)),
                        Tab(child: Text('4',style: TextStyle(fontSize: 7),)),
                        Tab(child: Text('5',style: TextStyle(fontSize: 7),)),
                        Tab(child: Text('6',style: TextStyle(fontSize: 7),)),
                        Tab(child: Text('7',style: TextStyle(fontSize: 7),)),
                        Tab(child: Text('8',style: TextStyle(fontSize: 7),)),
                        Tab(child: Text('9',style: TextStyle(fontSize: 7),)),

                      ]),
                  width: 250,
                  height: 15,
                  color: Colors.black,
                ),
                Container(
                    height: MediaQuery.of(context).size.height*0.65,
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    ),
                    child: TabBarView(
                        children:[
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
                        ])
                )
              ])
          ),
        ]);
  }
}

