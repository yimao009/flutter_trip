import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  final _controller = PageController(
      initialPage: 0
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text('travel page'),
      )
    );
  }
}
