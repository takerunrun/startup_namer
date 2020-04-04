import 'package:flutter/material.dart';

class BuildListItems {
  List<ListItem> items() {
    return List<ListItem>.generate(
        1000, (index) => index % 6 == 0 ? HeadingItem('Heading $index') : MessageItem("Sender $index", "Message body $index"),
    );
  }
}

class GridListWithHeader extends StatelessWidget {
  final List<ListItem> items;

  GridListWithHeader({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Mixed List"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return ListTile(
            title: item.buildTitle(context),
            subtitle: item.buildSubtitle(context),
          );
        },
      ),
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline,
    );
  }

  Widget buildSubtitle(BuildContext context) => null;
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  Widget buildTitle(BuildContext context) => Text(sender);

  Widget buildSubtitle(BuildContext context) => Text(body);
}

