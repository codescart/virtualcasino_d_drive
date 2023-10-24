import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualcasino/constant/apihelper.dart';

Future<Album> fetchAlbum() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'user_id';
  final value = prefs.getString(key) ?? "0";
  final response = await http
      .get(Uri.parse(Apiconstant.baseurl+'payinuser?user_id=$value&amount=100'));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
class Album {
  final String id;
  final String msg;
  final String error;

  const Album({
    required this.id,
    required this.msg,
    required this.error,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      msg: json['msg'],
      error: json['error'],
    );
  }
}


class Payin_user extends StatefulWidget {
  const Payin_user({super.key});

  @override
  State<Payin_user> createState() => _MyAppState();
}

class _MyAppState extends State<Payin_user> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.id),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      );

  }
}