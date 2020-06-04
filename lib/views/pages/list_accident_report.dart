import 'package:flutter/material.dart';
import 'package:pelaporanbencanaadmin/views/pages/i_accident.dart';

class LIstAccidentReport extends StatefulWidget {
  @override
  _LIstAccidentReportState createState() => _LIstAccidentReportState();
}

class _LIstAccidentReportState extends State<LIstAccidentReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History Laporan Saya",style: TextStyle(color: Colors.white),),
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

                /*IconButton(
                  icon: Icon(Icons.filter_list,color: Colors.redAccent,),
                  color: Colors.redAccent,
                ),*/
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 70),
              child: ItemAccident()),
        ],
      ),

      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => CreateChangeManagement()
            ),
          );
        },
        label: Text('Create'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),*/
    );
  }

}
