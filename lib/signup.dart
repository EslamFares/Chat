import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Chat.dart';
import 'HomePage.dart';

class SignUp extends StatefulWidget {
  static const String id = 'SignUp';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureText = true;
  String email;
  String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser() async {
    FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    Navigator.push(context, MaterialPageRoute(builder: (context) => Chat(user:user)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Chat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset(
                  'assets/img/chat.png',
                  height: 150,
                  width: 150,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: TextField(
              onChanged: (val) => email = val,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                        color: Colors.black.withOpacity(.5), width: 0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                        color: Colors.black.withOpacity(.5), width: 0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                        color: Colors.black.withOpacity(.5), width: 0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black.withOpacity(.5), width: 0),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  contentPadding: EdgeInsets.all(20),
                  fillColor: Colors.black.withOpacity(.5),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  hintText: 'email@address.com',
                  hintStyle:
                      TextStyle(color: Colors.grey.shade700, fontSize: 16)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: TextField(
              onChanged: (val) => password = val,
              obscureText: _obscureText,
              autocorrect: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                        color: Colors.black.withOpacity(.5), width: 0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                        color: Colors.black.withOpacity(.5), width: 0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                        color: Colors.black.withOpacity(.5), width: 0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black.withOpacity(.5), width: 0),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  contentPadding: EdgeInsets.all(7),
                  fillColor: Colors.black.withOpacity(.5),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: Colors.white,
                  ),
                  hintText: '* * * * * * * *',
                  hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                      size: 25.0,
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: GestureDetector(
                onTap: () async {
                  await registerUser();
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    decoration: BoxDecoration(
                        color:Colors.blue,// Color(0xffeb4137)
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Text(
                      'Sign UP',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
