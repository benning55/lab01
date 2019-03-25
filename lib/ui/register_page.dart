import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
  String regis_username;
  String regis_password;
  String regis_password2;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  labelText: "email",
                  hintText: "please input your email",
                  icon: Icon(Icons.email)),
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) {
                regis_username = value;
              },
              validator: (value) {
                if (value == "admin") return "user นี้มีอยู่ในระบบแล้ว";
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "password",
                  hintText: "please input your password",
                  icon: Icon(Icons.lock)),
              onSaved: (value) {
                regis_password = value;
              },
              obscureText: true,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "password",
                hintText: "please input your password again",
                icon: Icon(Icons.lock),
              ),
              onSaved: (value) {
                regis_password2 = value;
              },
              validator: (value) {
                if (value != regis_password) {
                  return "password ไม่ตรงกัน";
                }
              },
              obscureText: true,
            ),
            RaisedButton(
              child: Text("CONTINUE"),
              onPressed: () {
                _formKey.currentState.save();
                if (!_formKey.currentState.validate()) {
                } else if (regis_username == "" ||
                    regis_password == "" ||
                    regis_password2 == "") {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Alert"),
                        content: const Text("กรุณาระบุข้อมูลให้ครบถ้วน"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  Navigator.pushNamed(context, "/");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
