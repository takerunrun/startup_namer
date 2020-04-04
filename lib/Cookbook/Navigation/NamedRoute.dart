import 'package:flutter/material.dart';

class NamedRouteFirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Launch screen"),
          onPressed: () {
            // Navigate to named screen
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}

class NamedRouteSecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Go back"),
          onPressed: () {
            // Navigate to first screen
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}