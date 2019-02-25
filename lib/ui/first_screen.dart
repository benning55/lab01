import 'package:flutter/material.dart';
import './detail_screen.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';

class FirstScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FirstScreenState();
  }

}

class FirstScreenState extends State {
  
  List<String> _passengers = <String>["", "1", "2", "3", "4", "5"];
  String _passenger = "1";
  File _image;
  

  Future getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
          _image = image;
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: (){
          getImage();
        },
      ),
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Form(
        child: ListView(
          children: <Widget>[
            _image == null ? Text("No omages selected") : Image.file(_image),
          InputDecorator(
            decoration: InputDecoration(
              icon: Icon(Icons.people),
              labelText: "Passenger"
            ),
            isEmpty: _passenger == "",
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: _passenger,
                isDense: true,
               onChanged: (value){
                 setState(() {
                   _passenger = value;
                  });
               },
               items: _passengers.map((String value){
                 return DropdownMenuItem <String>(
                   child: Text(value),
                   value: value,
                 );
               }).toList(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: DateTimePickerFormField(
              inputType: InputType.date,
              initialDate: DateTime.now(),
              format: DateFormat("yyyy-MM-dd"),
              decoration: InputDecoration(labelText: "Date-Time"),
            ),
          )
        ],
        ),  
      ),
    );
  }
}