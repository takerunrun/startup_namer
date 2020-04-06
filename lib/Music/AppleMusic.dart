import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class AppleMusicBottomSheetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Container(
              color: Colors.black12,
              child: Center(
                child: Text("Apple Music Bottom Sheet"),
              ),
            ),
          ),
          BottomSheet()
        ],
      ),
    );
  }
}

const double minHeight = 64;

class BottomSheet extends StatefulWidget {
  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  double get maxHeight => MediaQuery.of(context).size.height - 64;
  double get bottomSheetCornerRadius => lerp(8, 32);
  double get imageTopMargin => lerp(8, 24 + MediaQuery.of(context).padding.top);
  double get imageLeftMargin => lerp(20, 32);
  double get imageSize => lerp(48, MediaQuery.of(context).size.width - 64);
  double get playIconSize => lerp(36, 64);
  double get playIconRightMargin => lerp(18, (MediaQuery.of(context).size.width / 2) - 32);
  double get playIconBottomMargin => lerp(14, 110);

  double lerp(double min, double max) => lerpDouble(min, max, _controller.value);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600)
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          height: lerp(minHeight, maxHeight),
          left: 0,
          right: 0,
          bottom: 64,
          child: GestureDetector(
            onTap: _toggle,
            onVerticalDragUpdate: _handleDragUpdate,
            onVerticalDragEnd: _handleDragEnd,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(bottomSheetCornerRadius)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0,-10),
                    )
                  ]
              ),
              child: Stack(
                children: <Widget>[
                  MusicImage(
                    topMargin: imageTopMargin,
                    leftMargin: imageLeftMargin,
                    size: imageSize,
                  ),
                  PlayIcon(
                    size: playIconSize,
                    rightMargin: playIconRightMargin,
                    bottomMargin: playIconBottomMargin,
                  ),
                ],
              ),
            ),
          )
        );
      },
    );
  }

  void _toggle() {
    final bool isOpen = _controller.status == AnimationStatus.completed;
    _controller.fling(velocity: isOpen ? -2 : 2);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta / maxHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating || _controller.status == AnimationStatus.completed) return;

    final double flingVelocity = details.velocity.pixelsPerSecond.dy / maxHeight;
    if (flingVelocity < 0.0) {
      _controller.fling(velocity: math.max(2.0, -flingVelocity));
    } else if (flingVelocity > 0.0) {
      _controller.fling(velocity: math.min(-2.0, -flingVelocity));
    } else {
      _controller.fling(velocity: _controller.value < 0.5 ? -2.0 : 2.0);
    }
  }
}

class MusicImage extends StatelessWidget {
  final double topMargin;
  final double leftMargin;
  final double size;
  
  const MusicImage({
    Key key,
    @required this.topMargin,
    @required this.leftMargin,
    @required this.size,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      top: topMargin,
      left: leftMargin,
      height: size,
      width: size,
      child: Image.network("https://i.pinimg.com/564x/61/6a/93/616a936fc10afce93c646f5d03ddcf80.jpg"),
    );
  }
}

class PlayIcon extends StatelessWidget {
  final double size;
  final double rightMargin;
  final double bottomMargin;

  PlayIcon({
    Key key,
    @required this.size,
    @required this.rightMargin,
    @required this.bottomMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      right: rightMargin,
      bottom: bottomMargin,
      height: size,
      width: size,
      child: Icon(
        Icons.play_arrow,
        color: Colors.black38,
        size: size,
      ),
    );
  }
}