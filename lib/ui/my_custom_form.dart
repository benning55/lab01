import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyCustomFormState();
  }
  
}

class MyCustomFormState extends State<MyCustomForm>{

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Form"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Image.asset(
              "resources/1.jpg",
              height: 100
              ),
            TextFormField(
              decoration: InputDecoration(
                labelText:  "Password",
                hintText: "please input your password",
                icon:  Icon(Icons.lock),
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: (value){
                if(value.isEmpty){
                  return "Please Input Value";
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText:  "Email",
                hintText: "please input your Email",
                icon:  Icon(Icons.email),
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: (value){
                if(value.isEmpty){
                  return "Please Input Value";
                }
              },
            ),
            RaisedButton(
              child: Text("Continue"),
              onPressed: (){
                _formKey.currentState.validate();
              },
            )
          ],
        ),
      ),
    );
  }

}