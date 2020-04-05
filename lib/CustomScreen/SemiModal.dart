import 'package:flutter/material.dart';

class SemiModalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SemiModal();
  }
}

class SemiModal extends StatefulWidget {
  @override
  _SemiModalState createState() => _SemiModalState();
}

class _SemiModalState extends State<SemiModal> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('SemiModal'),
      ),
      body: Center(
        child: AnimatedContainer(

        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}