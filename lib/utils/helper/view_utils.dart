import 'package:flutter/material.dart';
import 'package:pelaporanbencanaadmin/utils/values/colors.dart';

import 'CommonUtils.dart';

class ViewUtils {
  static Color PrimaryColor = const Color(0xFFFFFFFF);

  static Widget appBar(BuildContext context,String title) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
      ),
      leading: IconButton(
        icon: new Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context, false),
      ),
      backgroundColor: PrimaryColor,
    );
  }

  /*static buildFlushbarError(BuildContext context,String error,{VoidCallback onPressed}) {
    return CommonUtils.showFloatingFlushbar(
        context,
        "No Internet",
        "Silakan Periksa koneksi internet anda");
  }*/

  static Widget buildErrorWidget(BuildContext context,String error,{VoidCallback onPressed}) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      padding: EdgeInsets.all(10),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
//               Text(
//                 "Error occured: $error",
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).textTheme.subtitle,
//               ),
              Container(
              height: 200,
              child: Center(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.sim_card_alert,
                        color: MyColor.bgColorNindya,
                        size: 50.0,
                      ),
                      Text("Koneksi anda tidak stabil"),
                    ],
                  )
              )
              ),
              SizedBox(height: 10,),
              if(onPressed != null) MaterialButton(
                color: MyColor.bgColorNindya,
                elevation: 0,
                minWidth: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: onPressed,
                child: const Text('Coba lagi', style: TextStyle(fontSize: 15,color: Colors.white)),
              )
            ],
          )),
    );
  }

  static Widget buildMessageWidget(BuildContext context,{VoidCallback onPressed,bool tapBelow = false}) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(
            Icons.do_not_disturb,
            color: MyColor.bgColorNindya,
            size: 50.0,
          ),
              Text(
                "Kosong",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.title,
              ),
              if(tapBelow) Text(
                "Tidak ada data ditemukan",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.body2,
              ),
//               RaisedButton(
//                 onPressed: onPressed,
//                 child: const Text('Refresh', style: TextStyle(fontSize: 20)),
//               )
            ],
          )),
    );
  }
  static Widget buildLoadingWidget(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Loading data from API...",
                style: Theme.of(context).textTheme.subtitle),
            Padding(
              padding: EdgeInsets.only(top: 5),
            ),
            CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
        ));
  }
}