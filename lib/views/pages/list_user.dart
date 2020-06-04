import 'package:flutter/material.dart';
import 'package:pelaporanbencanaadmin/views/pages/i_accident.dart';
import 'package:pelaporanbencanaadmin/views/pages/i_user.dart';

class ListUser extends StatefulWidget {
  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List User",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.redAccent,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10,left: 10,right: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      scrollPadding: EdgeInsets.all(4),
                      decoration: new InputDecoration(
                        labelText: "Cari",
                        //hintText: "Masukan Keyword",
                        labelStyle: TextStyle(color: Colors.black),
                        hintStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.red,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(Icons.search,color: Colors.redAccent,),
                            onPressed: () {}
                        ),
                        //fillColor: Colors.green
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 70),
              child: ItemUser()),
        ],
      ),
    );
  }
}
