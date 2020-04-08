import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Item {
  String title;
  String imageUrl;
  bool isLocked;
  String soundFileName;

  Item(String title, String imageUrl, bool isLocked, String soundFileName) {
    this.title = title;
    this.imageUrl = imageUrl;
    this.isLocked = isLocked;
    this.soundFileName = soundFileName;
  }
}

class Group {
  String groupName;
  List<Item> items;
  Group(String groupName, List<Item> items) {
    this.groupName = groupName;
    this.items = items;
  }
}

class AudioStore with ChangeNotifier {
  List<Group> groups = [TestData().buildGroup()];
  Item playingItem = TestData().noItem();

  void selectSound(Item item) {
    playingItem = item;
    notifyListeners();
  }
}

class TestData {
  Item _buildItem() {
    return Item(
      'せせらぎ',
      'https://i.pinimg.com/236x/75/73/9e/75739e17a9eef65c8874abf559cfd117.jpg',
      false,
      'uminokooe.mp3'
    );
  }

  Item noItem() {
    return Item(
      'no item',
      'https://i.pinimg.com/236x/4c/99/e8/4c99e8fa02a66505bf06a8a1aebe37f4.jpg',
      false,
      ''
    );
  }

  Group buildGroup() {
    return Group(
      '海の声',
      [_buildItem(), _buildItem()]
    );
  }
}

class StateSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      create: (context) => AudioStore(),
      child: Consumer<AudioStore>(
        builder: (context, audioStore, _) {
          return Scaffold(
            body: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 128),
                  child: AudioCollection(audioStore.groups[0]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AudioCollection extends StatelessWidget {
  Group group;

  AudioCollection(Group group) {
    this.group = group;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: <Widget>[
        _buildHeader(context),
      ]..addAll(section(context, group))..add(
          SliverPadding(
            padding: EdgeInsets.only(bottom: 64),
          )
      ),
    );
  }

  List<Widget> section(BuildContext context, Group group) {
    return <Widget>[
      SliverPadding(
        padding: EdgeInsets.fromLTRB(16, 32, 16, 8),
        sliver: SliverList(
          delegate: SliverChildListDelegate([
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 32,
                width: 128,
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.all(Radius.circular(16))
                ),
                child: Center(
                  child: Text(
                    group.groupName,
                    style: TextStyle(
                        fontFamily: 'NotoSansJP',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
      SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            crossAxisCount: 2,
            childAspectRatio: 0.74,
          ),
          delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  child: AudioCollectionCell(group.items[index]),
                );
              },
              childCount: group.items.length
          ),
        ),
      )
    ];
  }

  Widget _buildHeader(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(16, 80, 16, 8),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          Container(
            height: MediaQuery.of(context).size.width * 0.66,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                    color: Colors.black26,
                    blurRadius: 16
                )]
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.network(
                'https://i.pinimg.com/474x/25/7d/df/257ddf9575c61ebca115d0946c22f56b.jpg',
                fit: BoxFit.cover,
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class AudioCollectionCell extends StatelessWidget {

  Item item;

  AudioCollectionCell(Item item) {
    this.item = item;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                  color: Colors.black26,
                  blurRadius: 16,
                  offset: Offset(0, 8)
              )]
          ),
          constraints: BoxConstraints.expand(),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image.network(
              item.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: _loackIcon(item.isLocked)
        ),
        Align(
          alignment: Alignment.topRight,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                topRight: Radius.circular(8)
            ),
            child: Container(
              color: Colors.black38.withOpacity(0.5),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                'Placess',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 30,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            child: Container(
              height: double.infinity,
              color: Colors.black38.withOpacity(0.5),
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          left: 10,
          child: Text(
            item.title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _loackIcon(bool isLocked) {
    if (isLocked) {
      return Container(
        padding: EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(11)),
          child: Container(
            color: Colors.black38,
            width: 22,
            height: 22,
            child: Image.asset(
              'images/lock.png',
              width: 12,
              height: 12,
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}