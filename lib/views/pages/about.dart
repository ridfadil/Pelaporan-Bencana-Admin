import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "Profile Saya",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Card(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Dede Muktamar",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                      "Skripsi XXXXXXXXX",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontSize: 14)),
                  SizedBox(
                    height: 12,
                  ),
                  Text("Jurusan : Teknik Informatika",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontSize: 14)),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                      "Moto Hidup : Hiduplah seperti larry",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontSize: 14)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        size: 30,
                        color: Colors.black,
                      ),
                      Text("(021) 2700400",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14)),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
