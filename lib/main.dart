import 'package:chat/Chat.dart';
import 'package:chat/HomePage.dart';
import 'package:chat/signin.dart';
import 'package:chat/signup.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat',
      theme: ThemeData.dark(),
     initialRoute: HomePage.id,
      routes: {
       HomePage.id:(context)=>HomePage(),
       SignIn.id:(context)=>SignIn(),
       SignUp.id:(context)=>SignUp(),
       Chat.id:(context)=>Chat(),
      },
    );
  }
}
