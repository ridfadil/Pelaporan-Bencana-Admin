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
          "Tentang Aplikasi",
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
                      "Skripsi : Aplikasi lapor berbasis android di badan penanggulangan bencana daerah kab.kuningan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontSize: 14)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Aplikasi ini di adalah suatu fasilitas bagi masyarakat untuk melaporkan suatu kejadian bencana di sekitar masyarakat agar dapat di tindak lanjut secara cepat dan tanggap oleh badan penanggulangan bencana daerah kabupaten kuningan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontSize: 14)),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Jurusan : Teknik Informatika",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontSize: 14)),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.phone,
                        size: 20,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("089509917676",
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
