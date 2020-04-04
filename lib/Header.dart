import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
        height: 150.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage('https://images.unsplash.com/photo-1517030330234-94c4fb948ebc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1275&q=80')
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.redAccent,
        ),
      child: Center(
        child: Text(
          '8:00',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 80),
        ),
      ),
    );
  }
}