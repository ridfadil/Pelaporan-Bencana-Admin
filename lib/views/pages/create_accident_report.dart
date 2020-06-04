import 'dart:io';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pelaporanbencanaadmin/utils/helper/CommonUtils.dart';

class CreateAccidentReport extends StatefulWidget {
  @override
  _CreateAccidentReportState createState() => _CreateAccidentReportState();
}

class _CreateAccidentReportState extends State<CreateAccidentReport> {

  var dateFormat = new DateFormat("dd-MM-yyyy");
  var timeFormat = new DateFormat("kk:mm");
  TextEditingController _date = new TextEditingController();
  TextEditingController _time = new TextEditingController();


  String jenisPerubahan;
  String prioritasPerubahan;
  String periode;
  File _allFile;
  File _CameraFile;
  List<File> listDokumen = new List<File>();

  var _jenisLaporanKecelakaan = [
    "Kecelakaan Tunggal",
    "Kecelakaan Bukan Tunggal",
  ];

  var _prioritasPerubahan = [
    "Perubahan Mayor",
    "Perubahan Minor"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buat Laporan kecelakaan",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 60),
          child: Column(
            children: <Widget>[
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
              buildTextField("Nama Pelapor",isDisable: false),
              SizedBox(
                height: 10,
              ),
              buildTextField("No Handphone Pelapor",isDisable: false),
              SizedBox(
                height: 10,
              ),
              buildTextField("Alamat Pelapor",isDisable: false),
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
              buildDateField("Tanggal Kecelakaan"),
              SizedBox(
                height: 10,
              ),
              buildTimeField("Waktu Kecelakaan"),
              SizedBox(
                height: 10,
              ),
              buildDropDownPerubahanField("Jenis Kecelakaan"),
              SizedBox(
                height: 10,
              ),
              buildTextField("Lokasi/Alamat kecelakaan"),
              SizedBox(
                height: 10,
              ),
              buildTextField("Uraian Kecelakaan"),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add_circle,
                      color: Colors.redAccent,
                      size: 40,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.folder,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                      tooltip: 'Attach File Kecelakaan',
                      onPressed: () {
                        getAllFile();
                      },
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                      tooltip: 'Attach File From Camera',
                      onPressed: () {
                        getCameraFile();
                      },
                    ),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: listDokumen.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  String nameFile =
                  path.basename(listDokumen[index].path);
                  return InkWell(
                    child: Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Text("${nameFile}")),
                              IconButton(
                                icon: Icon(
                                  Icons.close,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    listDokumen.removeAt(index);
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          CommonUtils.showToast("Berhasil Melaporkan Kecelakaan");
          Navigator.pop(context);
        },
        label: Text('Laporkan !'),
        icon: Icon(Icons.save),
        backgroundColor:Colors.red,
      ),
    );
  }



  Future getAllFile() async {
    var files = await FilePicker.getFile(type: FileType.any);
    if (files != null) {
      setState(() {
        _allFile = files;
        listDokumen.add(_allFile);
      });
    } else {
      CommonUtils.showToast("Files tidak boleh kosong");
    }
  }

  Future getCameraFile() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _CameraFile = image;
        listDokumen.add(_CameraFile);
      });
    } else {
      CommonUtils.showToast("Files tidak boleh kosong");
    }
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

  Widget buildDropDownPrioritasField(String title)=> FormField<String>(
    builder: (FormFieldState<String> state) {
      return InputDecorator(
        decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black, fontSize: 16.0),
            errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
            hintText: title,
            labelText: title,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        isEmpty: prioritasPerubahan == '',
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: prioritasPerubahan,
            isDense: true,
            onChanged: (String newValue) {
              setState(() {
                prioritasPerubahan = newValue;
                state.didChange(newValue);
              });
            },
            items: _prioritasPerubahan.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      );
    },
  );

  Widget buildDropDownPerubahanField(String title)=> FormField<String>(
    builder: (FormFieldState<String> state) {
      return InputDecorator(
        decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black, fontSize: 16.0),
            errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
            hintText: title,
            labelText: title,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        isEmpty: jenisPerubahan == '',
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: jenisPerubahan,
            isDense: true,
            onChanged: (String newValue) {
              setState(() {
                jenisPerubahan = newValue;
                state.didChange(newValue);
              });
            },
            items: _jenisLaporanKecelakaan.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      );
    },
  );

  Widget buildDateField(String title) => Container(
    child: DateTimeField(
      controller: _date,
      format: dateFormat,
      readOnly: true,
      decoration: new InputDecoration(
        labelText: title,
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
            icon: Icon(Icons.date_range,color: Colors.redAccent,),
            onPressed: () {}),
        //fillColor: Colors.green
      ),
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
    ),
  );

  Widget buildTimeField(String title) => Container(
    child: DateTimeField(
      controller: _time,
      format: timeFormat,
      readOnly: true,
      decoration: new InputDecoration(
        labelText: title,
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
            icon: Icon(Icons.access_time,color: Colors.redAccent,),
            onPressed: () {}),
      ),
      onShowPicker: (context, currentValue) async {
        final time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
        );
        return DateTimeField.convert(time);
      },
    ),
  );
}
