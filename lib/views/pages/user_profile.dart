import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pelaporanbencanaadmin/session/constants.dart';
import 'package:pelaporanbencanaadmin/session/session.dart';
import 'package:pelaporanbencanaadmin/utils/helper/CommonUtils.dart';
import 'package:pelaporanbencanaadmin/utils/helper/DialogUtils.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String userID;

  TextEditingController nama = new TextEditingController();
  TextEditingController alamat = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController telp = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController role = new TextEditingController();

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "Profile Pelapor",
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
                    color: Colors.redAccent,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildTextField("Email (can't edit)",email,isDisable: false),
                  SizedBox(
                    height: 12,
                  ),
                  buildTextField("Nama",nama,isDisable: true),
                  SizedBox(
                    height: 12,
                  ),
                  buildTextField("No Hp.",telp,isDisable: true),
                  SizedBox(
                    height: 12,
                  ),buildTextField("Alamat",alamat,isDisable: true),
                  SizedBox(
                    height: 12,
                  ),
                  FlatButton(
                    color: Colors.red,
                    child: Text('Edit',style: TextStyle(color: Colors.white)),
                    onPressed: (){
                      _showDialogUpdate();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future getProfile() async {
    userID = await Session.getUserId();
    Firestore.instance
        .collection('user')
        .document('$userID')
        .get()
        .then((DocumentSnapshot ds) {
      setState(() {
        nama.text = ds.data['nama'];
        email.text = ds.data['email'];
        telp.text = ds.data['telp'];
        alamat.text = ds.data['alamat'];
        password.text = ds.data['password'];
        role.text = ds.data['role'];
      });
    });
  }

  void _showDialogUpdate() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            Future.value(false);
            return false;
          },
          child: AlertDialog(
            title: new Text("Update Profil"),
            content: new Text("Apakah anda ingin update profil?"),
            actions: <Widget>[
              new FlatButton(
                  child: new Text("Tidak"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              new FlatButton(
                child: new Text("Iya"),
                onPressed: () {
                  _updateData();
                },
              ),
            ],
          ) ??
              false,
        );
      },
    );
  }

  void _updateData(){
    if(nama.text.isEmpty){
      CommonUtils.showToast("Nama tidak boleh kosong");
    }else if(email.text.isEmpty){
      CommonUtils.showToast("Email tidak boleh kosong");
    } else if(telp.text.isEmpty){
      CommonUtils.showToast("Telp tidak boleh kosong");
    } else{
      MyDialog.loading(context, "Edit User...");
      Firestore.instance
          .collection('user')
          .document(userID)
          .updateData({
        '${FirebaseKeys.FB_USER_NAMA}': '${nama.text.toString()}',
        '${FirebaseKeys.FB_USER_ALAMAT}': '${alamat.text.toString()}',
        '${FirebaseKeys.FB_USER_EMAIL}': '${email.text.toString()}',
        '${FirebaseKeys.FB_USER_NO_TELP}': '${telp.text.toString()}',
        '${FirebaseKeys.FB_USER_PASSWORD}': '${password.text.toString()}',
        '${FirebaseKeys.FB_USER_ROLE}': '${role.text.toString()}',
      }).then((result){
        MyDialog.dismiss(context);
        CommonUtils.showToast("Berhasil Update Data");
        Navigator.pop(context);
        Navigator.pop(context);
      }).catchError((onError){
        CommonUtils.showToast("Gagal Update Data");
        MyDialog.dismiss(context);
      });
    }
  }

  Widget buildTextField(String title,TextEditingController controller,{bool isDisable=true}) => Container(
    child: TextFormField(
      keyboardType: TextInputType.multiline,
      controller: controller,
      maxLines: null,
      maxLength: null,
      enabled: isDisable,
      decoration: new InputDecoration(
        labelText: title,
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.black),
        fillColor: Colors.red,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        /*suffixIcon: IconButton(
                            icon: Icon(Icons.search,color: Colors.redAccent,),
                            onPressed: () {}
                        ),*/
        //fillColor: Colors.green
      ),
    ),
  );
}
