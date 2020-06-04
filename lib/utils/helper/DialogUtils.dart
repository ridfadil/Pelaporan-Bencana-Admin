import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDialog {
  ///loading dialog
  static bool isDismissVal = false;

  static void loading(BuildContext context,String message) async {
    await Future.delayed(Duration(milliseconds: 50));
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => new Dialog(
        child: Container(
          padding: EdgeInsets.all(4),
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.all(6),
                child: new CircularProgressIndicator(),
              ),
              new Text("$message"),
            ],
          ),
        ),
      ),
    ).then((val) {
      isDismissVal = true;
    });
  }

  static dismiss(context) async {
    Navigator.of(context).pop(); //pop dialog
  }

  static isDismiss() {
    return isDismissVal;
  }

  ///dialog alert
  static void dialogAlert(BuildContext context, String title, String body) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title ?? ''),
          content: new Text(body ?? ''),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this.reportList, {this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = List();

  _buildChoiceList() {
    List<Widget> choices = List();

    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    });

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

class DialogList extends StatefulWidget {
  final List<String> reportList;
  final Function(String) onSelectionChanged;

  DialogList(this.reportList, {this.onSelectionChanged});

  @override
  _DialogListState createState() => _DialogListState();
}

class _DialogListState extends State<DialogList> {
  // String selectedChoice = "";
  //List<String> selectedChoices = List();
  List<String> selectedChoices = List();
  var value = "";

  _buildChoiceList() {
    List<Widget> choices = List();

    //Dialog list
    widget.reportList.forEach((item) {
      choices.add(Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(2.0),
            child: ListTile(
              title: Text(item),
              selected: selectedChoices.contains(item),
              onTap: () {
                setState(() {
                  selectedChoices.remove(item);
                  selectedChoices.add(item);
                  value = "";
                  value = item;
                  widget.onSelectionChanged(value);
                });
              },
            ),
          ),
        ],
      ));
    });

    //chip single
    /*widget.reportList.forEach((item) {
      choices.add(Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(2.0),
            child: ChoiceChip(
              label: Text(item),
              selected: selectedChoices.contains(item),
              onSelected: (selected) {
                setState(() {
                  //selectedChoices.contains(item);
                  *//*? selectedChoices.remove(item)
                      : selectedChoices.add(item);*//*
                  selectedChoices.remove(item);
                  selectedChoices.add(item);
                  value = "";
                  value = item;
                  widget.onSelectionChanged(value);
                });
              },
            ),
          ),
        ],
      ));
    });*/

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

class BeautifulAlertDialog extends StatelessWidget {

  String title;
  String message;
  String type;
  String id;

  BeautifulAlertDialog(this.title,this.message, this.type,{Key key, this.id});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(right: 16.0),
          height: 150,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75),
                  bottomLeft: Radius.circular(75),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              )
          ),
          child: Row(
            children: <Widget>[
              SizedBox(width: 20.0),
              CircleAvatar(radius: 55, backgroundColor: Colors.grey.shade200, child: Icon(FontAwesomeIcons.carCrash,color: Colors.redAccent,)),
              SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title, style: Theme.of(context).textTheme.title,),
                    SizedBox(height: 10.0),
                    Flexible(
                      child: Text(message),
                    ),
                    SizedBox(height: 10.0),
                    Row(children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          child: Text("Tidak",style: TextStyle(fontSize: 7),),
                          color: Colors.green,
                          colorBrightness: Brightness.dark,
                          onPressed: (){Navigator.pop(context);},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: RaisedButton(
                          child: Text("Ya",style: TextStyle(fontSize: 10),),
                          color: Colors.red,
                          colorBrightness: Brightness.dark,
                          onPressed: (){
                            if (type == "logout"){
                              //Session.clear();
                              Navigator.pushNamedAndRemoveUntil(context, "/login", (Route<dynamic> route) => false);
                            }
                            else{
                              Navigator.pop(context);
                            }
                          },

                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        ),
                      ),
                    ],)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
