import 'package:flutter/material.dart';
import './pages/index_page.dart'; // 导入index.dart

// // 这里为入口函数
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: IndexPage(),
      theme: ThemeData(
      fontFamily: "PingFang", // 统一指定应用的字体。
      primarySwatch: Colors.green,
      primaryColor: Colors.green
      ),    // 指定去加载 Index页面。
    );
  }
}
// var container = Container(
//   color: Colors.green,
//   width: 300.0,
//   height: 500.0,
//   margin: EdgeInsets.all(20.0),
//   child: Column(
//     children: <Widget>[
//       Text('hello'),
//       Text('hello'),
//       Text('hello'),
//       Text('hello')
//     ],
//   )
// );

