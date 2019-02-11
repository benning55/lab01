import 'package:flutter/material.dart';
import './detail_screen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Center(
        child: FlatButton(
          child: Text('Next page'),
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => DetailScreen(title: "Hello"),
                )
                );
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context) => DetailScreen(title: "Hekki",)
            // ));
          },
        ),
      ),
    );
  }
}