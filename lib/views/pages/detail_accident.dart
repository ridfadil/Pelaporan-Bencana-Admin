import 'package:flutter/material.dart';
import 'package:pelaporanbencanaadmin/views/pages/m_genral_list.dart';

class DetailAccident extends StatefulWidget {
  @override
  _DetailAccidentState createState() => _DetailAccidentState();

  GeneralListModel generaelModel;
  DetailAccident({Key key, this.generaelModel}) : super(key: key);
}


class _DetailAccidentState extends State<DetailAccident> {
  GeneralListModel generaelModel;

  @override
  void initState() {
    generaelModel = widget.generaelModel;
    super.initState();
  }
/// ini untuk''
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "Detail Laporan Saya",
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
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 1,
                          color: Colors.redAccent,
                        ),
                      ),
                      Text("Rincian Laporan"),
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
                  buildTextField("Tanggal Bencana",generaelModel.tanggalKecelakaan,isDisable: false),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField("Waktu Bencana",generaelModel.waktuKecelakaan,isDisable: false),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField("Jenis Bencana",generaelModel.jenisKecelakaan,isDisable: false),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField("Lokasi/Alamat Bencana",generaelModel.lokasiKecelakaan,isDisable: false),
                  SizedBox(
                    height: 10,
                  ),
                  buildTextField("Uraian Bencana",generaelModel.uraianKecelakaan,isDisable: false),
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
