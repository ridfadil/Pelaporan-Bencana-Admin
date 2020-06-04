import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class CommonUtils {

  ///validasi
  static String validation(TextEditingController listVal,bool _isValidate) {
    if(listVal.text.isEmpty && _isValidate) return 'Field Harus di isi';
    else return null;
  }

  ///Toast
  static void showToast(String message, {Toast toastLength}) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
  }

  ///Toast
  static void showToastLong(String message, {Toast toastLength}) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_LONG);
  }

  ///snackbar
  static void showFloatingFlushbar(BuildContext context, String title, String message) {
    Flushbar(
      margin: EdgeInsets.all(10),
      borderRadius: 8,
      duration:  Duration(seconds: 2),
      backgroundGradient: LinearGradient(
        colors: [Colors.blue, Colors.blueAccent],
        stops: [0.6, 1],
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      title: title,
      message: message,
    )..show(context);
  }

  ///Untuk tanggal
  static Future<String> datePicker(BuildContext context,String toFormat) async {
    DateTime selectedDate = DateTime.now();
    String toDate ;
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) selectedDate = picked;
    toDate = DateFormat('$toFormat').format(selectedDate);
    return toDate;
  }

  ///ubah format tanggal dari date time
  static Future<String> changeFormatDate(BuildContext context,DateTime fromFormat,String toFormat) async {
    String toDate;
    toDate = DateFormat('$toFormat').format(fromFormat);
    return toDate;
  }

  ///ubah format tanggal dari string
  static changeFormatDateFromString(String fromFormat,String toFormat) {
    String toDate;
    DateTime dateTime = DateTime.parse(fromFormat);
    toDate = DateFormat('$toFormat').format(dateTime);
    return toDate;
  }

  ///validasi Controller
  static bool validateController(List<String> listVal) {
    bool isValidate = true;
    for (var i = 0; i < listVal.length; i++) {
      if(listVal[i].isEmpty){
        isValidate = false;
      }
    }
    return isValidate;
  }

  ///write  ke file
  static Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  ///generate sha15
 /* static String sha512(text) {
    Digest sha512 = new SHA512Digest();
    var plaintText = Uint8List.fromList(text.codeUnits);
    var cipherText = sha512.process(plaintText);
    var result = formatBytesAsHexString(cipherText);
    return result;
  }*/

  ///Format byte hex string
  static String formatBytesAsHexString(Uint8List bytes) {
    var result = new StringBuffer();
    for (var i = 0; i < bytes.lengthInBytes; i++) {
      var part = bytes[i];
      result.write('${part < 16 ? '0' : ''}${part.toRadixString(16)}');
    }
    return result.toString();
  }

}
