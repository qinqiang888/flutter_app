import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _IdeaPageState();
}

class _IdeaPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('聊一聊'),
        actions: <Widget>[new Container()],
      ),
      body: new Center(
        child: Column( 
          children: <Widget>[
            Container(),
            Text('聊一聊')
          ],
        ),
      ),
    );
  }
}
class SearchTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}
