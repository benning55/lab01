import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  String username;
  String password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> _passengers = ["", "1", "2", "3", "4", "5"];
  String _passenger = "1";
  File _image;
  Future getImage() async {
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
          child: Icon(Icons.camera_alt),
          onPressed: () {
            getImage();
          },
        ),
        appBar: AppBar(
          title: Text("first Screen"),
        ),
        body: Form(
          child: ListView(
            children: <Widget>[
              _image == null ? Text("No image selected") : Image.file(_image),
              //if : else
              InputDecorator(
                  decoration: InputDecoration(labelText: "passenger"),
                  isEmpty: _passenger == "",
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _passenger,
                      isDense: true,
                      onChanged: (value) {
                        setStage() {
                          _passenger = value;
                        }
                      },
                      items: _passengers.map((String value) {
                        return DropdownMenuItem<String>(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                    ),
                  )),
              DateTimePickerFormField(
                inputType: InputType.date,
                initialDate: DateTime.now(),
                format: DateFormat("yyyy-mm-dd"),
                decoration: InputDecoration(labelText: "Date"),
              )
            ],
          ),
        ));
  }
}
