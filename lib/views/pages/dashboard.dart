import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pelaporanbencanaadmin/session/session.dart';
import 'package:pelaporanbencanaadmin/utils/helper/DialogUtils.dart';
import 'package:pelaporanbencanaadmin/utils/values/dimens.dart';
import 'package:pelaporanbencanaadmin/views/pages/about.dart';
import 'package:pelaporanbencanaadmin/views/pages/detail_user.dart';
import 'package:pelaporanbencanaadmin/views/pages/list_accident_report.dart';
import 'package:pelaporanbencanaadmin/views/pages/list_user.dart';
import 'package:pelaporanbencanaadmin/views/pages/user_profile.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<String> imageLinks = [
    'https://cdn-image.bisnis.com/posts/2019/06/10/932449/antarafoto-jalan-trans-sulawesi-putus-kendari-10062019-jojon2-1.jpg',
    'https://cdn-image.bisnis.com/posts/2019/01/14/878200/antarafoto-badan-jalan-aceh-tengah-longsor-080119-apls-1-1.jpg',
    'https://apahabar.com/wp-content/uploads/2018/12/ilustrasi-tanah-longsor.jpg'
  ];

  TextEditingController namaUser = new TextEditingController();
  TextEditingController emailUser = new TextEditingController();

  Size deviceSize;
  String userId;

  @override
  void initState() {
    getNama().then((namaValue) {
      setState(() {
        namaUser.text = namaValue;
        //CommonUtils.showToast("NAMA : "+namaUser.text);
      });
    });

    getEmail().then((emailValue) {
      setState(() {
        emailUser.text = emailValue;
        //CommonUtils.showToast("EMAIL : "+emailUser.text);
      });
    });

    getUserId().then((userIdDoc) {
      setState(() {
        userId = userIdDoc;
        //CommonUtils.showToast("EMAIL : "+emailUser.text);
      });
    });
    super.initState();
  }

  Future <String> getNama() async {
    return await Session.getName();
  }

  Future <String> getEmail() async {
    return await Session.getMail();
  }
  Future <String> getUserId() async {
    return await Session.getUserId();
  }

  Widget appBarColumn(BuildContext context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 18.0),
          child: new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(
                      FontAwesomeIcons.userShield,
                      color: Colors.white,
                      size: 30,
                    ),
                    /*onPressed: () => Navigator.canPop(context)
                        ? Navigator.pop(context)
                        : null,*/
                  ),
                  Column(
                    children: <Widget>[
                      Text(namaUser.text.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(emailUser.text.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                  new IconButton(
                    icon: new Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _oprtionMenu(context);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      );

  Widget searchCard() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.search),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Cari"),
                  ),
                ),
                Icon(Icons.menu),
              ],
            ),
          ),
        ),
      );

  Widget actionMenuCard(BuildContext context) => Card(
        //elevation: 6,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Image.asset("assets/images/logo_pelaporan.png",scale: 20,)
                                ),),
                            Text("Pelaporan Bencana",
                                style: TextStyle(
                                    fontSize: MyDimens.textMedium,
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            child: Container(
                              child: Card(
                                elevation: 4,
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.user,
                                        size: 40.0,
                                        color: Colors.orange,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Text(
                                              "Daftar User")),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ListUser()));
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            child: Container(
                              child: Card(
                                elevation: 4,
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Icons.warning,
                                        size: 40.0,
                                        color: Colors.orange,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Text(
                                            "Daftar pelaporan Bencana",
                                            textAlign: TextAlign.center,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LIstAccidentReport()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget carousel() => Container(
        margin: EdgeInsets.only(top: 10),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              CarouselSlider(
                height: 200.0,
                items: imageLinks.map((imageLink) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.network(
                            imageLink,
                            fit: BoxFit.cover,
                          ));
                    },
                  );
                }).toList(),
                reverse: false,
                enableInfiniteScroll: true,
                autoPlay: true,
                initialPage: 0,
                scrollDirection: Axis.horizontal,
                pauseAutoPlayOnTouch: Duration(seconds: 5),
                onPageChanged: (int pageNumber) {},
                viewportFraction: 0.8,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
              )
            ])),
      );

  Widget allCards(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            appBarColumn(context),
            //searchCard(),
            carousel(),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            actionMenuCard(context),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            //balanceCard(),
          ],
        ),
      );

  void _oprtionMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(
                      FontAwesomeIcons.tasks,
                      color: Colors.lightGreen,
                    ),
                    title: new Text('Pilih Menu'),
                    onTap: () => {}),
                Container(
                  height: 1,
                  color: Colors.orange,
                ),
                new ListTile(
                    trailing: new Icon(FontAwesomeIcons.user),
                    title: new Text('Profil'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserProfile()));
                    }),
                Container(
                  height: 1,
                  color: Colors.orange,
                ),
                new ListTile(
                    trailing: new Icon(FontAwesomeIcons.info),
                    title: new Text('Tentang Aplikasi'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => About()));
                    }),
                Container(
                  height: 1,
                  color: Colors.orange,
                ),
                new ListTile(
                    trailing: new Icon(Icons.exit_to_app),
                    title: new Text(
                      'Logout',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return BeautifulAlertDialog("Logout",
                                "Apakah Anda ingin logout?", "logout");
                          });
                    }),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        //fit: StackFit.expand,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: deviceSize.height * 0.5,
                color: Colors.redAccent,
              ),
              Container(
                height: deviceSize.height * 0.5,
                color: Colors.redAccent,
              ),
            ],
          ),
          Container(child: allCards(context)),
        ],
      ),
    );
  }
}
