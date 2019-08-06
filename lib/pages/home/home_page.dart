import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('首页')),
        body: FutureBuilder(
          future: getHomePageContent(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              List<Map> swiperDataList =
                  (data['data']['slides'] as List).cast(); // 顶部轮播组件数
              List<Map> navigatorList =
                  (data['data']['category'] as List).cast(); // 分类列表
              String AdUrl = data['data']['advertesPicture']
                  ['PICTURE_ADDRESS']; //adBanner广告

              List<Map> recommendList =
                  (data['data']['recommend'] as List).cast(); // 商品推荐

              List<Map> floor1 =
                  (data['data']['floor1'] as List).cast(); //楼层1商品和图片
              List<Map> floor2 =
                  (data['data']['floor2'] as List).cast(); //楼层1商品和图片
              List<Map> floor3 =
                  (data['data']['floor3'] as List).cast(); //楼层1商品和图片
              return SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  SwiperDiy(swiperDataList: swiperDataList), //页面顶部轮播组件
                  TopNavigator(navigatorList: navigatorList),
                  // AdBanner(AdUrl: AdUrl),
                  // LeaderPhone( leaderImage: leaderImage, leaderPhone: leaderPhone),
                  // Recommend(recommendList: recommendList),
                  FloorContent(floorGoodsList: floor1),
                  FloorContent(floorGoodsList: floor2),
                  FloorContent(floorGoodsList: floor3),
                  FloorTitle()
                  // Text(snapshot.data)
                ],
              ));
            } else {
              return Center(
                child: Text('加载中...'),
              );
            }
          },
        ));
  }
}

// 轮播
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      height: ScreenUtil().setHeight(260),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network("${swiperDataList[index]['image']}",
              fit: BoxFit.fill);
        },
        itemCount: swiperDataList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

// 分类
class TopNavigator extends StatelessWidget {
  final List navigatorList;
  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, item) {
    return Container(
        child: InkWell(
      onTap: () {
        print('点击了导航');
      },
      child: Column(
        children: <Widget>[
          Image.network(item['image'],
              width: ScreenUtil().setWidth(90),
              height: ScreenUtil().setHeight(90)),
          Text(item['mallCategoryName'])
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (navigatorList.length > 10) {
      navigatorList.removeRange(10, navigatorList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(4.0),
        children: navigatorList.map((item) {
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}

//广告banner
class AdBanner extends StatelessWidget {
  final String AdUrl;
  const AdBanner({Key key, this.AdUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(AdUrl),
    );
  }
}

//商品推荐
class Recommend extends StatelessWidget {
  final List recommendList;

  Recommend({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(300),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[_titleWidget(), _recommedList()],
      ),
    );
  }

//推荐商品标题
  Widget _titleWidget() {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))));
  }

  Widget _recommedList() {
    return Container(
      height: ScreenUtil().setHeight(280),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index) {
          return _item(index);
        },
      ),
    );
  }

  Widget _item(index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(280),
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(left: BorderSide(width: 1, color: Colors.black12))),
        child: Column(
          children: <Widget>[
            index % 2 == 0 ? _singleItem(index) : _doblueItem(index),
          ],
        ),
      ),
    );
  }

  Widget _singleItem(index) {
    return Container(
        height: ScreenUtil().setHeight(280),
        width: ScreenUtil().setWidth(375),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image']),
          ],
        ));
  }

  Widget _doblueItem(index) {
    return Container(
        height: ScreenUtil().setHeight(280),
        width: ScreenUtil().setWidth(375),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image']),
            Image.network(recommendList[index]['image'])
          ],
        ));
  }
}

//列表标题
class FloorTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Text('为您推荐'),
      alignment:Alignment.centerLeft,
    );
  }
}
//楼层商品组件
class FloorContent extends StatelessWidget {
  final List floorGoodsList;

  FloorContent({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_firstRow()],
      ),
      margin: EdgeInsets.only(top: 10.0),
    );
  }

  Widget _firstRow() {
    return Container(
        child: Row(
          children: <Widget>[
            Container(
              child:_goodsItem(floorGoodsList[0]),
                decoration: BoxDecoration(
                border: Border(right: BorderSide(width: 1, color: Colors.grey[200])),
                )
              ),
            Column(
              children: <Widget>[
                _goodsItem(floorGoodsList[1]),
                _goodsItem(floorGoodsList[2]),
              ],
              
            )
          ],
        )
        );
  }

  Widget _goodsItem(Map goods) {
    return Container(
      width: ScreenUtil().setWidth(374),
      child: InkWell(
        onTap: () {
        },
        // child: Image.network(goods['image']),
        child:Container(
          child: Image.network(goods['image'],fit: BoxFit.contain),
          //  decoration:BoxDecoration(
          //    image: DecorationImage(
          //       image: NetworkImage(goods['image']),
          //       fit: BoxFit.contain
          //   )
          // ),
        )
      ),
    );
  }
}
