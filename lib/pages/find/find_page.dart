import 'package:flutter/material.dart';

class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _FindPageState();
}

class _FindPageState extends State<FindPage> {
  List<Map> findList = [
    {
      "name": "生意圈",
      "image":
          "http://img.yimutian.com/avatar/a4fa3f7529f283f424f9c2b95458352f.png"
    },
    {
      "name": "附近",
      "image":
          "http://img.yimutian.com/misc/5b7ffcd76ef1433be51b806be67e7c23.png"
    },
    {
      "name": "直播",
      "image":
          "http://img.yimutian.com/misc/5b2261545c265556f20265417b80c7c2.png"
    },
    {
      "name": "黑榜",
      "image":
          "http://img.yimutian.com/misc/5d1dc826885b9303cb1dcfb672b7695c.png"
    },
    {
      "name": "火牛视频",
      "image":
          "http://img.yimutian.com/misc/5bd98f575c26555cbd15c80994e0eb05.png"
    },
    {
      "name": "问答",
      "image":
          "http://img.yimutian.com/misc/5bd98f135c26555cbd15c8088cbb202e.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new Text('发现'),
          actions: <Widget>[new Container()],
        ),
        body: FindPageList(findList:findList));
  }
}

class FindPageList extends StatelessWidget {
  final List findList;
  FindPageList({Key key, this.findList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xf3e2e2e2),
      child: new ListView.builder(
        itemCount: findList.length,
        itemBuilder: (BuildContext context, int index) {
          return new Column(
            children: <Widget>[findPageItem(index)],
          );
        },
      ),
    );
  }
  Widget findPageItem(index) {
  return Container(
    height: 60.0,
    decoration: BoxDecoration(
      color: Colors.white
    ),
    margin: EdgeInsets.only(top: 10.0),
    child: InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.black45,
      onTap: () {
        print('触发点击');
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(findList[index]['image'], width: 40.0, height: 40.0),
            Padding(padding: EdgeInsets.only(right: 16.0)),
            Center(
              child: Text(findList[index]['name'],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black87, fontSize: 16.0)),
            ),
          ],
        ),
      ),
    ),
  );
}
}

