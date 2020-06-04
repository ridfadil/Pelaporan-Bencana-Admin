import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
                  buildTextField("Nama",isDisable: false),
                  SizedBox(
                    height: 12,
                  ),
                  buildTextField("No Hp.",isDisable: false),
                  SizedBox(
                    height: 12,
                  ),buildTextField("Alamat",isDisable: false),
                  SizedBox(
                    height: 12,
                  ),
                  FlatButton(
                    color: Colors.red,
                    child: Text('Edit',style: TextStyle(color: Colors.white)),
                    onPressed: (){},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String title,{bool isDisable=true}) => Container(
    child: TextFormField(
      keyboardType: TextInputType.multiline,
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
