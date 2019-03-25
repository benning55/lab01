import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Home"),
            centerTitle: true,
          ),
          bottomNavigationBar: Container(
            constraints: BoxConstraints(maxHeight: 150.0),
            color: Colors.blue,
            child: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white30,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.view_quilt)),
                Tab(icon: Icon(Icons.notifications)),
                Tab(icon: Icon(Icons.explore)),
                Tab(icon: Icon(Icons.person)),
                Tab(icon: Icon(Icons.settings))
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: Container(
                  child: new Text("Home", style: TextStyle(fontSize: 30)),
                  alignment: Alignment(0.0, 0.0),
                ),
              ),
              Center(
                child: Container(
                  child: new Text("Notify", style: TextStyle(fontSize: 30)),
                  alignment: Alignment(0.0, 0.0),
                ),
              ),
              Center(
                child: Container(
                  child: new Text("Map", style: TextStyle(fontSize: 30)),
                  alignment: Alignment(0.0, 0.0),
                ),
              ),
              Center(
                child: Container(
                  child: new Text("Profile", style: TextStyle(fontSize: 30)),
                  alignment: Alignment(0.0, 0.0),
                ),
              ),
              Center(
                child: Container(
                  child: new Text("Setup", style: TextStyle(fontSize: 30)),
                  alignment: Alignment(0.0, 0.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
