import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pelaporanbencanaadmin/session/session.dart';
import 'package:pelaporanbencanaadmin/utils/components/delayed_animation.dart';
import 'package:pelaporanbencanaadmin/views/pages/dashboard.dart';
import 'package:pelaporanbencanaadmin/views/pages/login.dart';

import '../../utils/values/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  int count = 3;
  double _scale;
  AnimationController _controller;
  bool isLogin = false;

  Future <bool> getLogin() async {
    if(await Session.isLoggedIn() !=null){
      return Session.isLoggedIn();
    }else{
      return false;
    }
  }



  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: MyColor.badgeColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DelayedAimation(
                  child: Container(
                    child: Text(
                      "Selamat Datang",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                          color: color),
                    ),
                  ),
                  delay: delayedAmount + 1000,
                ),
                DelayedAimation(
                  delay: delayedAmount + 2000,
                  child: AvatarGlow(
                    endRadius: 90,
                    duration: Duration(seconds: 2),
                    glowColor: Colors.white24,
                    repeat: true,
                    repeatPauseDuration: Duration(seconds: 2),
                    startDelay: Duration(seconds: 1),
                    child: Material(
                        elevation: 8.0,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[100],
                          child: Container(
                              padding: EdgeInsets.all(20.0),
                              child: buildLogo()),
                          radius: 50.0,
                        )
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                DelayedAimation(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Admin",
                        style: TextStyle(fontSize: 20.0, color: color),
                      ),Text(
                        "Aplikasi Pelaporan",
                        style: TextStyle(fontSize: 20.0, color: color),
                      ),Text(
                        "Bencana",
                        style: TextStyle(fontSize: 20.0, color: color),
                      ),
                    ],
                  ),
                  delay: delayedAmount + 3000,
                ),
                SizedBox(
                  height: 100.0,
                ),
                DelayedAimation(
                  child: GestureDetector(
                    onTapDown: _onTapDown,
                    onTapUp: _onTapUp,
                    child: Transform.scale(
                      scale: _scale,
                      child: _animatedButtonUI,
                    ),
                  ),
                  delay: delayedAmount + 4000,
                ),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          )),
    );
  }

  @override
  void initState() {
    getLogin().then((onValue) {
      setState(() {
        isLogin = onValue;
      });
    });

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }


  Hero buildLogo() {
    return new Hero(
        tag: "Logo",
        child: Image.asset("assets/images/logo_pelaporan.png"),
    );
  }

  Widget get _animatedButtonUI => InkWell(
    child: Container(
      height: 60,
      width: 270,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          'Lanjutkan',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: MyColor.badgeColor,
          ),
        ),
      ),
    ),
    onTap: () {
      navigationPage();
      /*Navigator.of(context).pushReplacement(PageRouteBuilder(transitionDuration: Duration(seconds: 2),
              pageBuilder: (_, __, ___) => Login()));*/
    },
  );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  Future navigationPage() async {
    if(isLogin){
      Navigator.of(context).pushReplacement(PageRouteBuilder(
          transitionDuration: Duration(seconds: 2),
          pageBuilder: (_, __, ___) => Dashboard()));
    }else{
      Navigator.of(context).pushReplacement(PageRouteBuilder(
          transitionDuration: Duration(seconds: 2),
          pageBuilder: (_, __, ___) => LoginUser()));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  ///get status login
  Future<bool> isSession() async {
    if (Session.getToken() != null) {
      return await Session.isLoggedIn();
    } else {
      return false;
    }
  }
}
