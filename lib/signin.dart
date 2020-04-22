import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Chat.dart';

class SignIn extends StatefulWidget {
  static const String id = 'SignIn';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _obscureText = true;
  String email;
  String password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser() async {
    FirebaseUser user = (await _auth.signInWithEmailAndPassword(
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
                    Icons.account_circle,
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
                  await loginUser();
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    decoration: BoxDecoration(
                        color:Colors.amber,// Color(0xffeb4137)
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Text(
                      'Log In',
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
