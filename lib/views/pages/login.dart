import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pelaporanbencanaadmin/session/constants.dart';
import 'package:pelaporanbencanaadmin/session/session.dart';
import 'package:pelaporanbencanaadmin/utils/components/custom_clipper.dart';
import 'package:pelaporanbencanaadmin/utils/helper/CommonUtils.dart';
import 'package:pelaporanbencanaadmin/utils/helper/DialogUtils.dart';
import 'package:pelaporanbencanaadmin/utils/values/colors.dart';
import 'package:pelaporanbencanaadmin/views/pages/dashboard.dart';

class LoginUser extends StatefulWidget {
  @override
  _LoginUserState createState() => _LoginUserState();
}


class _LoginUserState extends State<LoginUser> {
  final email = new TextEditingController();
  final password = new TextEditingController();
  bool isValidate;

  @override
  void initState() {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    isValidate = false;
    email.text = "";
    password.text = "";
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Future _doLogin() async {
    /*MyDialog.loading(context,"sedang login...");
    Response response = await ApiService.login(
        context: context, email: email.text, password: password.text);
    MyDialog.dismiss(context);
    return new Future.delayed(new Duration(milliseconds: 0), () {
      if (response.statusCode == APIResponseCode.SUCCESS) {
        var res = new Map<String, dynamic>.from(response.data);
        print(res);
        LoginResponse token = LoginResponse.fromJson(res);
        _setSession(token);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => DashboardDrawer()));
      } else {
        Fluttertoast.showToast(
            msg: response.statusCode.toString() + " - " + response.toString(),
            toastLength: Toast.LENGTH_SHORT);
        return null;
      }
    });*/
  }

  /*void _setSession(LoginResponse token) {
    Session.setToken(token.results.accessToken);
    Session.setRole(token.results.roles);
    Session.setLoggedIn(true);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipper2(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0x22ff3a5a), Color(0x22fe494d)])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0x44ff3a5a), Color(0x44fe494d)])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper1(),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Material(
                          elevation: 8.0,
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[100],
                            child: Container(
                                padding: EdgeInsets.all(20.0),
                                child: buildLogo()),
                            radius: 50.0,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "Admin Pelaporan Kecelakaan",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [ MyColor.badgeColor, Colors.blue])),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                //onChanged: (String value){},
                controller: email,
                cursorColor: Colors.lightBlue,
                decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.email,
                        color:  MyColor.badgeColor,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: password,
                obscureText: true,
                //onChanged: (String value){},
                cursorColor: Colors.lightBlue,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.lock,
                        color:  MyColor.badgeColor,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color:  MyColor.badgeColor),
                child: FlatButton(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  onPressed: () async {
                    if(password.text.isEmpty){
                      CommonUtils.showToast("Password Belum diisi");
                    }else if(email.text.isEmpty){
                      CommonUtils.showToast("Email Belum diisi");
                    } else{
                      MyDialog.loading(context, "Sedang login");

                      bool isThere = false;

                      await Firestore.instance
                          .collection('user')
                          .getDocuments()
                          .then((snapshot) {
                        for(int i = 0 ; i< snapshot.documents.length;i++){
                          if(snapshot.documents[i].data["${FirebaseKeys.FB_USER_EMAIL}"] == email.text.toString() && snapshot.documents[i].data["${FirebaseKeys.FB_USER_PASSWORD}"] == password.text.toString() && snapshot.documents[i].data["${FirebaseKeys.FB_USER_ROLE}"] == "1"){
                            isThere = true;
                          }
                        }
                      });

                      if(isThere){
                        Firestore.instance
                            .collection('user')
                            .where("email", isEqualTo: "${email.text.toString()}")
                            .where("password", isEqualTo: "${password.text.toString()}")
                            .snapshots()
                            .listen((data){
                          if(data.documents.length > 0){
                            _setSession(
                              data.documents[0].data['${FirebaseKeys.FB_USER_EMAIL}'],
                              data.documents[0].data['${FirebaseKeys.FB_USER_NAMA}'],
                              data.documents[0].data['${FirebaseKeys.FB_USER_ROLE}'],
                              data.documents[0].documentID,
                            );
                            CommonUtils.showToast("Selamat Datang ${data.documents[0].data['${FirebaseKeys.FB_USER_NAMA}']} :) ");
                            //MyDialog.dismiss(context);
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Dashboard()));
                          }
                        });
                      } else{
                        CommonUtils.showToast("Email dan Password tidak Valid atau Anda bukan Admin");
                        isThere = false;
                      }

                      MyDialog.dismiss(context);
                    }
                  },
                ),
              )),
          SizedBox(height: 20,),
          /*Center(
            child: InkWell(
              child: Text("Registrasi", style: TextStyle(color: MyColor.badgeColor,fontSize: 12 ,fontWeight: FontWeight.w700),),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => Register()));
              },
            ),
          ),*/
          SizedBox(height: 40,),
          /*Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Don't have an Account ? ", style: TextStyle(color:Colors.black,fontSize: 12 ,fontWeight: FontWeight.normal),),
              Text("Sign Up ", style: TextStyle(color:Colors.red, fontWeight: FontWeight.w500,fontSize: 12, decoration: TextDecoration.underline )),
            ],
          )*/
        ],
      ),
    );

  }

  void _setSession(String email,String nama, String role, String documentID) {
    Session.setName(nama);
    Session.setMail(email);
    Session.setRole(role);
    Session.setUserId(documentID);
    Session.setLoggedIn(true);
  }

  Hero buildLogo() {
    return new Hero(
        tag: "Logo",
        child: Container(
            child: new Image.asset(
              'assets/images/report.png',
            )));
  }
}
