import 'package:flutter/material.dart';

class AnimatedOpacityApp extends StatefulWidget {
  final String title;

  AnimatedOpacityApp({Key key, this.title}) : super(key: key);

  @override
  _AnimatedOpacityAppState createState() => _AnimatedOpacityAppState();
}

class _AnimatedOpacityAppState extends State<AnimatedOpacityApp> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = ! _visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: Icon(Icons.flip),
      ),
    );
  }
}