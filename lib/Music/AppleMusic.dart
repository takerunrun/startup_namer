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

const double minHeight = 120;

class BottomSheet extends StatefulWidget {
  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  double get maxHeight => MediaQuery.of(context).size.height;

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
          bottom: 0,
          child: GestureDetector(
            onTap: _toggle,
            onVerticalDragUpdate: _handleDragUpdate,
            onVerticalDragEnd: _handleDragEnd,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              decoration: const BoxDecoration(
                color: Color(0xFF162A49),
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Stack(
                children: <Widget>[

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