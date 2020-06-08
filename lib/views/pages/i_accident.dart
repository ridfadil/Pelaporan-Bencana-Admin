import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:pelaporanbencanaadmin/session/constants.dart';
import 'package:pelaporanbencanaadmin/utils/helper/CommonUtils.dart';
import 'package:pelaporanbencanaadmin/utils/helper/utility.dart';

class ItemAccident extends StatefulWidget {
  String idDocument;
  ItemAccident({Key key, this.idDocument}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ItemAccidentState();
}


class _ItemAccidentState extends State<ItemAccident> {
  String _radioValue;
  String choice;
  String choiceAlamatPengirimSurat;
  final _agreementController = new TextEditingController();
  String choiceKompensasi;
  String idDocument;

  @override
  void initState() {
    idDocument = widget.idDocument;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('report')
            //.where('${FirebaseKeys.FB_REPORT_ID_USER}', isEqualTo: idDocument)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.documents.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: makeList(index, context, snapshot),
                      onTap: () {
                        /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailUser(generaelModel: listGeneral[index],)));*/
                      },
                    );
                  },
                ),
              );
          /*ListView(
                children: snapshot.data.documents.map((
                    DocumentSnapshot document) {
                  return new ListTile(
                    title: new Text(document['${FirebaseKeys.FB_USER_NAMA}']),
                    subtitle: new Text(
                        document['${FirebaseKeys.FB_USER_ALAMAT}']),
                  );
                }).toList(),
              );*/
          }
        });
  }

  makeList(int index, BuildContext context,
      AsyncSnapshot<QuerySnapshot> snapshot) =>
      Container(
        //margin: EdgeInsets.only(left:8,right: 8,top: 2, bottom: 2),
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              elevation: 0.0,
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                child: Column(
                  children: <Widget>[
                    ExpandablePanel(
                      header: Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: <Widget>[
                              Text("Nomor ${index + 1}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )),
                      tapHeaderToExpand: true,
                      hasIcon: true,
                      // <-- Dri
                      iconColor: Colors.redAccent,
                      collapsed: ExpandableButton(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Jenis Kecelakaan   : ${snapshot.data.documents[index].data["${FirebaseKeys.FB_REPORT_JENIS_KECELAKAAN}"]}"),
                                  Text("Nama Pelapor : " +
                                      snapshot.data.documents[index].data[
                                      '${FirebaseKeys.FB_USER_NAMA}']),
                                  SizedBox(height: 2),
                                  Text("Alamat Pelapor : " +
                                      snapshot.data.documents[index].data[
                                      '${FirebaseKeys.FB_USER_ALAMAT}']),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      expanded: Column(children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Nama Pelapor : " +
                                      snapshot.data.documents[index].data[
                                      '${FirebaseKeys.FB_USER_NAMA}']),
                                  SizedBox(height: 2),
                                  Text("Alamat Pelapor : " +
                                      snapshot.data.documents[index].data[
                                      '${FirebaseKeys.FB_USER_ALAMAT}']),
                                  SizedBox(height: 2),
                                  Text("Email : " +
                                      snapshot.data.documents[index].data[
                                      '${FirebaseKeys.FB_USER_EMAIL}']),
                                  SizedBox(height: 2),
                                  Text("No Hp : " +
                                      snapshot.data.documents[index].data[
                                      '${FirebaseKeys.FB_USER_NO_TELP}']),
                                  SizedBox(height: 2),
                                  Text(
                                      "Jenis Kecelakaan   : ${snapshot.data.documents[index].data["${FirebaseKeys.FB_REPORT_JENIS_KECELAKAAN}"]}"),
                                  SizedBox(height: 2),
                                  Text(
                                      "Tanggal : ${snapshot.data.documents[index].data["${FirebaseKeys.FB_REPORT_DATE_KECELAKAAN}"]}"),
                                  SizedBox(height: 2),
                                  Text(
                                      "Waktu Kecelakaan: ${snapshot.data.documents[index].data["${FirebaseKeys.FB_REPORT_TIME_KECELAKAAN}"]}"),
                                  SizedBox(height: 2),
                                  Text(
                                      "Uraian Kecelakaan: ${snapshot.data.documents[index].data["${FirebaseKeys.FB_REPORT_URAIAN_KECELAKAAN}"]}"),
                                  Container(
                                    margin: EdgeInsets.all(20),
                                    alignment: Alignment.centerLeft,
                                    height: 200,
                                    width: 200,
                                    child: Utility.imageFromBase64String(snapshot.data.documents[index].data["${FirebaseKeys.FB_REPORT_FILE_KECELAKAAN}"]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.redAccent,
            ),
          ],
        ),
      );

  Widget buildTextField(String title, {bool isDisable = true}) => Container(
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

  Widget _buildApprovalDialog(BuildContext context /*, int index*/) {
    return StatefulBuilder(builder: (context, setState) {
      return new AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        contentPadding: EdgeInsets.only(top: 10.0, left: 10, right: 10),
        title: const Text('Approval'),
        content: SingleChildScrollView(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Radio(
                    value: '1',
                    groupValue: _radioValue,
                    onChanged: radioButtonChanges,
                  ),
                  Text(
                    "Approve",
                  ),
                  Radio(
                    value: '0',
                    groupValue: _radioValue,
                    onChanged: radioButtonChanges,
                  ),
                  Text(
                    "Reject",
                  ),
                ],
              ),
              buildTextField("Uraian"),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            textColor: Colors.redAccent,
            child: const Text('Simpan'),
          ),
        ],
      );
    });
  }

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      choice = value;
      _agreementController.text = choice;
      debugPrint(choice);
    });
  }

  Widget _buildChoiceDialog(BuildContext context /*, int index*/) {
    return new AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      contentPadding: EdgeInsets.only(top: 10.0),
      title: const Text('Pilih Aksi'),
      content: SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 3, left: 6, right: 6, top: 6),
                  padding: EdgeInsets.all(6),
                  decoration: new BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(6.0),
                          topRight: const Radius.circular(6.0))),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 25.0,
                        ),
                      ),
                      Text(
                        'Ubah',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )),
              onTap: () {},
            ),
            InkWell(
              child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 6, left: 6, right: 6),
                  padding: EdgeInsets.all(6),
                  decoration: new BoxDecoration(
                    color: Colors.redAccent,
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.check,
                          color: Colors.black,
                          size: 25.0,
                        ),
                      ),
                      Text(
                        'Approval',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildApprovalDialog(context));
              },
            ),
            InkWell(
              child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 6, left: 6, right: 6),
                  padding: EdgeInsets.all(6),
                  decoration: new BoxDecoration(
                    color: Colors.redAccent,
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.view_headline,
                          color: Colors.black,
                          size: 25.0,
                        ),
                      ),
                      Text(
                        'Detail',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )),
              onTap: () {},
            ),
            InkWell(
              child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 6, left: 6, right: 6),
                  padding: EdgeInsets.all(6),
                  decoration: new BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: new BorderRadius.only(
                          bottomLeft: const Radius.circular(6.0),
                          bottomRight: const Radius.circular(6.0))),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.black,
                          size: 25.0,
                        ),
                      ),
                      Text(
                        'Hapus',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )),
              onTap: () {
                Navigator.of(context).pop();
                CommonUtils.showToast("Data dihapus");
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Colors.redAccent,
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
