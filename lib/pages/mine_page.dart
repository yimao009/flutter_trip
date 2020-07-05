import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  final _controller = PageController(
      initialPage: 0
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text('mine page'),
      )
    );
  }
}
