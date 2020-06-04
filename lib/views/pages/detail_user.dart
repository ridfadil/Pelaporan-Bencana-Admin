import 'package:flutter/material.dart';
import 'package:pelaporanbencanaadmin/views/pages/m_genral_list.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailUser extends StatefulWidget {
  @override
  _DetailUserState createState() => _DetailUserState();

  GeneralListModel generaelModel;
  DetailUser({Key key, this.generaelModel}) : super(key: key);
}


class _DetailUserState extends State<DetailUser> {
  GeneralListModel generaelModel;

  @override
  void initState() {
    generaelModel = widget.generaelModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "Detail User",
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
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 1,
                          color: Colors.redAccent,
                        ),
                      ),
                      Text("Rincian Pelapor"),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 1,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField("Nama Pelapor",generaelModel.namaPelapor,isDisable: false),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField("No Handphone Pelapor",generaelModel.noPelapor,isDisable: false),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField("Alamat Pelapor",generaelModel.alamatPelapor,isDisable: false),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.phone_forwarded,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text("Kontak User",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                        ],
                      ),
                    ),
                    onTap: (){
                      launch("tel:${generaelModel.noPelapor}");
                    },
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String title,String value,{bool isDisable=true}) => Container(
    child: TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      maxLength: null,
      enabled: isDisable,
      initialValue: value,
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
