import 'package:chat/signin.dart';
import 'package:chat/signup.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = 'HomeScreen';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset(
                      'assets/img/chat.png',
                      height: 150,
                      width: 150,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'My ',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    Text(
                      'Chat',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber),
                    )
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                CustomButton(txt: 'Sign in',callback:(){
                  Navigator.of(context).pushNamed(SignIn.id);
                } ,),
                CustomButton(txt: 'Sign up',callback:(){
                  Navigator.of(context).pushNamed(SignUp.id);
                } ,),
              ],
            )
          ],
        )
      ],
    ));
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String txt;

  const CustomButton({Key key, this.callback, this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Material(
        color: Colors.black.withOpacity(.4),
        elevation: 0,
        borderRadius: BorderRadius.circular(50),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 300,
          height: 55,
          child: Text(txt,style: TextStyle(fontSize: 20,letterSpacing: 1.2),),
        ),
      ),
    );
  }
}
