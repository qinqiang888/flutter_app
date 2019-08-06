import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _IdeaPageState();
}
class _IdeaPageState extends State<ShopPage> {

  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
        appBar: new AppBar(
          title: new Text('做生意'),
          actions: <Widget>[
            new Container()
          ],
        ),
        body: new Center(
          child: Text('做生意'),
        ),
    );
  }
}