import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
const APPBAR_SCROLL_OFFSET = 100;
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _imgUrls = [
    'https://dimg04.c-ctrip.com/images/100b180000015k83c8A71_R_1024_10000_Q90.jpg?proc=autoorient',
    'https://dimg04.c-ctrip.com/images/350912000000tdikw78EA.jpg',
    'https://dimg04.c-ctrip.com/images/zg0u1f000001gtb8k76AC.jpg'
  ];
  double appBarAplpha = 0;
  _onScroll(offset){
    double aplpha = offset/APPBAR_SCROLL_OFFSET;
    if(aplpha<0){
      print('ssssssssss----');
      aplpha = 0;
    } else if(aplpha>1) {
      aplpha = 1;
    }
    setState(() {
      appBarAplpha = aplpha;
    });
    print(offset);
    print(appBarAplpha);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: NotificationListener(
                  onNotification: (scrollNotifciation){
                    if(scrollNotifciation is ScrollUpdateNotification &&
                        scrollNotifciation.depth == 0) {
                      /// 滚动且是列表滚动
                      _onScroll(scrollNotifciation.metrics.pixels);
                    }
                  },
                  child: ListView(

                    children: <Widget>[
                      Container(
                        height: 160,
                        child: Swiper(
                          itemCount: _imgUrls.length,
                          autoplay: true,
                          itemBuilder: (context, index) {
                            return Image.network(
                              _imgUrls[index],
                              fit: BoxFit.fill,
                            );
                          },
                          pagination: SwiperPagination(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        color: Colors.greenAccent,
                        height: 800,
                        child: ListTile(
                          title: Text('哈哈哈哈'),
                        ),
                      )
                    ],
                  ),
                )),
            Opacity(
              opacity: appBarAplpha,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text('首页'),
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}
