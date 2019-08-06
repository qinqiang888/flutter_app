import 'package:flutter/material.dart';
import './home/home_page.dart';
import './shop/shop_page.dart';
import './find/find_page.dart';
import './chat/chat_page.dart';
import './user/user_page.dart';
import 'navigation_icon_view.dart'; // 如果是在同一个包的路径下，可以直接使用对应的文件名
import 'package:flutter_screenutil/flutter_screenutil.dart';
// 创建一个 带有状态的 Widget Index
class IndexPage extends StatefulWidget {

  //  固定的写法
  @override
  State<StatefulWidget> createState()  => new _IndexState();
}

// 要让主页面 Index 支持动效，要在它的定义中附加mixin类型的对象TickerProviderStateMixin
class _IndexState extends State<IndexPage> with TickerProviderStateMixin{

  int _currentIndex = 0;    // 当前界面的索引值
  List<NavigationIconView> _navigationViews;  // 底部图标按钮区域
  List<StatefulWidget> _pageList;   // 用来存放我们的图标对应的页面
  StatefulWidget _currentPage;  // 当前的显示页面

  // 定义一个空的设置状态值的方法
  void _rebuild() {
    setState((){});
  }
  @override
  void initState() {
    super.initState();

    // 初始化导航图标
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(icon: new Icon(Icons.home), title: new Text("首页"), vsync: this), // vsync 默认属性和参数
      new NavigationIconView(icon: new Icon(Icons.shop), title: new Text("做生意"), vsync: this),
      new NavigationIconView(icon: new Icon(Icons.explore), title: new Text("发现"), vsync: this),
      new NavigationIconView(icon: new Icon(Icons.textsms), title: new Text("聊一聊"), vsync: this),
      new NavigationIconView(icon: new Icon(Icons.person), title: new Text("我的"), vsync: this),
    ];

    // 给每一个按钮区域加上监听
    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }

    // 将我们 bottomBar 上面的按钮图标对应的页面存放起来，方便我们在点击的时候
    _pageList = <StatefulWidget>[
      HomePage(),
      ShopPage(),
      FindPage(),
      ChatPage(),
      UserPage()
    ];
    _currentPage = _pageList[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    // 声明定义一个 底部导航的工具栏
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationIconView) => navigationIconView.item)
          .toList(),  // 添加 icon 按钮
      currentIndex: _currentIndex,  // 当前点击的索引值
      type: BottomNavigationBarType.fixed,    // 设置底部导航工具栏的类型：fixed 固定
      onTap: (int index){   // 添加点击事件
        setState((){    // 点击之后，需要触发的逻辑事件
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
          _currentPage = _pageList[_currentIndex];
        });
      },
    );

    return new MaterialApp(
        home: new Scaffold(
          //保持页面状态
          backgroundColor: Colors.blue,
          body: IndexedStack(
            index: _currentIndex,
            children: _pageList
          ),
          bottomNavigationBar: bottomNavigationBar,   // 底部工具栏
        ),

      theme: ThemeData(
        backgroundColor: Color(0xFFe2e2e2),
        primarySwatch: Colors.green,   // 设置主题颜色
      ),

    );
  }

}