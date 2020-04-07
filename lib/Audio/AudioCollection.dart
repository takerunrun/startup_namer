import 'package:flutter/material.dart';
import 'package:startupnamer/Audio/AudioCollectionCell.dart';

class AudioCollection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
//        slivers: section(context)..addAll(section(context))
      slivers: <Widget>[
        _buildHeader(context),
      ]..addAll(section(context))..addAll(section(context)),
    );
  }

  List<Widget> section(BuildContext context) {
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
                    '海の声',
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
                  child: AudioCollectionCell(),
                );
              },
              childCount: 5
          ),
        ),
      )
    ];
  }

  Widget _buildHeader(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(16),
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
//            constraints: BoxConstraints.expand(),
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