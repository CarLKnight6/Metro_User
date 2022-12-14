import 'dart:async';
import 'package:flutter/material.dart';
import 'package:taxi_user/auth/login.dart';
import 'package:taxi_user/plugins/geolocation.dart';

class LoadingScreenToLogIn extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<LoadingScreenToLogIn> {
  @override
  void initState() {
    determinePosition();

    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //code para mawala to ang debug nga pula sa top right sa app screen
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            //This widget is useful when you have a single box that will normally be entirely visible,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Image(
                        width: 300,
                        image: AssetImage('assets/images/splashscreen.gif'),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
