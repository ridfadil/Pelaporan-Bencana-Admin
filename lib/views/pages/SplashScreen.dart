import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pelaporanbencanaadmin/session/session.dart';
import 'package:pelaporanbencanaadmin/utils/components/delayed_animation.dart';
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
                        "Aplikasi Pelaporan",
                        style: TextStyle(fontSize: 20.0, color: color),
                      ),Text(
                        "Kecelakaan",
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
        child: Icon(
            FontAwesomeIcons.carCrash,
          size: 50,
          color: Colors.redAccent,
        ));
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
    //PermissionStatus permission, permission2;

    /*if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      var release = androidInfo.version.release;
      var sdkInt = androidInfo.version.sdkInt;
      var manufacturer = androidInfo.manufacturer;
      var model = androidInfo.model;
      print('Android $release (SDK $sdkInt), $manufacturer $model');
      // Android 9 (SDK 28), Xiaomi Redmi Note 7
    }

    if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      var systemName = iosInfo.systemName;
      var version = iosInfo.systemVersion;
      var name = iosInfo.name;
      var model = iosInfo.model;
      print('$systemName $version, $name $model');
      // iOS 13.1, iPhone 11 Pro Max iPhone
    }*/

    /*bool isLoggedIn = await isSession();
    if (isLoggedIn != null && isLoggedIn) {
      setState(() {
        Navigator.pushReplacementNamed(context, '/dashboard');
      });
    } else {
      setState(() {
        //Navigator.of(context).pushReplacement(_createRoute());
        //Navigator.pushReplacementNamed(context, '/login');
        Navigator.of(context).pushReplacement(PageRouteBuilder(
            transitionDuration: Duration(seconds: 2),
            pageBuilder: (_, __, ___) => *//*Login()*//* LoginUser()));
      });
    }*/

    Navigator.of(context).pushReplacement(PageRouteBuilder(
        transitionDuration: Duration(seconds: 2),
        pageBuilder: (_, __, ___) => /*Login()*/ LoginUser()));

    /*if (Platform.isIOS) {
      ///permisi di ios
      permission = PermissionStatus.granted;
    } else {
      ///permisi untuk android

      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler().requestPermissions(
              [PermissionGroup.storage, PermissionGroup.location]);
      permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      permission2 = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.location);
    }
    print("PERMISSION" + permission.toString());
    if (permission != PermissionStatus.granted ||
        permission2 != PermissionStatus.granted) {
      if (count <= 0) {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      }
      _tryPermission();
    } else {
      bool isLoggedIn = await isSession();
      if (this.mounted) {
        if (isLoggedIn != null && isLoggedIn) {
          setState(() {
            Navigator.pushReplacementNamed(context, '/dashboard');
          });
        } else {
          setState(() {
            //Navigator.of(context).pushReplacement(_createRoute());
            //Navigator.pushReplacementNamed(context, '/login');
            Navigator.of(context).pushReplacement(PageRouteBuilder(
                transitionDuration: Duration(seconds: 2),
                pageBuilder: (_, __, ___) => *//*Login()*//* LoginUser()));
          });
        }
      }
    }*/
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
