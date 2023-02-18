import 'dart:async';
import 'package:eraasoftproject/screens/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                welcomescreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff53B175),

        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Image(
            image: AssetImage("assets/logo.png"),
          ),
        ),
      ),
    );
  }
}
