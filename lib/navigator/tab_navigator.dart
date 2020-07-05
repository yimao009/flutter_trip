import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/home_page.dart';
import 'package:flutter_trip/pages/mine_page.dart';
import 'package:flutter_trip/pages/search_page.dart';
import 'package:flutter_trip/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultStyle = Colors.grey;
  final _activeStyle = Colors.blue;
  var _selectIndex = 0;
  final _controller = PageController(
    initialPage: 0
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          MinePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _selectIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: _activeStyle,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _defaultStyle,),
            activeIcon: Icon(Icons.home, color: _activeStyle,),
            title: Text('首页')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: _defaultStyle,),
              activeIcon: Icon(Icons.search, color: _activeStyle,),
              title: Text('搜索')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt, color: _defaultStyle,),
              activeIcon: Icon(Icons.camera_alt, color: _activeStyle,),
              title: Text('旅拍')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: _defaultStyle,),
              activeIcon: Icon(Icons.account_circle, color: _activeStyle,),
              title: Text('我的')
          )
        ],
      ),
    );
  }
}
