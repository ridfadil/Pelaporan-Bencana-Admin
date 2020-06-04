import 'package:flutter/material.dart';
import 'package:pelaporanbencanaadmin/theme.dart';
import 'package:pelaporanbencanaadmin/views/pages/SplashScreen.dart';
import 'package:pelaporanbencanaadmin/views/pages/dashboard.dart';
import 'package:pelaporanbencanaadmin/views/pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DWS Nindya Karya',
      theme: AppsTheme.nindyaTheme,
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginUser(),
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}
