import 'package:flutter/material.dart';

class FloatingAppBarApp extends StatelessWidget {
  final title = 'Floating App Bar';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(title),
            floating: true,
            flexibleSpace: Placeholder(),
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(title: Text('Item #$index')),
              childCount: 100,
            ),
          )
        ],
      ),
    );
  }
}