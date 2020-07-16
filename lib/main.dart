import 'package:flutter/material.dart';
import 'package:get_advice/get_api.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow, brightness: Brightness.light,
        fontFamily: 'Lobster'),
      title: "Get Advice",
      home: Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: AppBar(title: Text("Follow this advice..."),
        ),
        body: GET_API(),
      ),
    );
  }
}