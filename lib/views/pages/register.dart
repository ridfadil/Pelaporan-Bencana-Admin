import 'package:flutter/material.dart';
import 'package:pelaporanbencanaadmin/utils/components/custom_clipper.dart';
import 'package:pelaporanbencanaadmin/utils/values/colors.dart';
import 'package:pelaporanbencanaadmin/views/pages/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}


class _RegisterState extends State<Register> {
  final _email = new TextEditingController();
  final _password = new TextEditingController();
  bool isValidate;

  @override
  void initState() {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    isValidate = false;
    _email.text = "";
    _password.text = "";
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future _doLogin() async {
    /*MyDialog.loading(context,"sedang login...");
    Response response = await ApiService.login(
        context: context, email: _email.text, password: _password.text);
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
                          "Registrasi User",
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
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                //onChanged: (String value){},
                controller: _email,
                cursorColor: Colors.lightBlue,
                decoration: InputDecoration(
                    hintText: "Nama",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.person,
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
                controller: _password,
                obscureText: true,
                //onChanged: (String value){},
                cursorColor: Colors.lightBlue,
                decoration: InputDecoration(
                    hintText: "No telp",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.phone,
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
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: _password,
                obscureText: true,
                //onChanged: (String value){},
                cursorColor: Colors.lightBlue,
                decoration: InputDecoration(
                    hintText: "Alamat",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.location_on,
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
          ),Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: _password,
                obscureText: true,
                //onChanged: (String value){},
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
                    "Registrasi",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    /*setState(() {
                      isValidate = true;
                      if(_email.text.isNotEmpty && _password.text.isNotEmpty) {
                        ApiService.checkConnection().then((con) {
                          con? *//*_doLogin()*//* auth_bloc.postLogin(context) : CommonUtils.showFloatingFlushbar(context, "No Internet","Silakan aktifkan internet anda");
                        });
                      }
                    });*/
                  },
                ),
              )),
          SizedBox(height: 20,),
          Center(
            child: InkWell(
              child: Text("Login", style: TextStyle(color: MyColor.badgeColor,fontSize: 12 ,fontWeight: FontWeight.w700),),
              onTap: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginUser()));
              },
            ),
          ),
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
  Hero buildLogo() {
    return new Hero(
        tag: "Logo",
        child: Container(
            child: new Image.asset(
              'assets/images/report.png',
            )));
  }
}
