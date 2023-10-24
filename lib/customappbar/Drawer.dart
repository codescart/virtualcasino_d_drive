import 'package:flutter/material.dart';


class Drawers extends StatefulWidget {
   Drawers({Key? key}) : super(key: key);

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text("Header"),
          ),
          ListTile(
            title: Text("Home"),
          )
        ],
      ),
    );
  }
}
