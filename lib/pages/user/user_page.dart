import 'package:flutter/material.dart';

class UserPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _UserPageState();
}

class _UserPageState extends State<UserPage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: new AppBar(
          title: new Text('我的'),
          actions: <Widget>[
            new Container()
          ],
        ),
        body: new Center(
          child: Text('我的'),
        ),
    );
  }
}