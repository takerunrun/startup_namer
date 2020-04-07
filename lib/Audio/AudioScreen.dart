import 'package:flutter/material.dart';
import 'package:startupnamer/Audio/AudioCollection.dart';

class AudioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AudioCollection(),
        ],
      ),
    );
  }
}