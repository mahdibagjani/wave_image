library wave_image;

import 'package:flutter/material.dart';

class WaveImage extends StatefulWidget {
  /// profile or image url (online)
  final String imageUrl;

  /// speed of wave. it's milliseconds
  final int speed;

  /// size of circle image
  final double imageSize;

  /// color of border
  final Color boarderColor;

  /// color of wave color
  final Color waveColor;

  /// width of border. most : boarderWidth >= 0
  final double boarderWidth;

  /// radius should nigger or equal [imageSize]
  final double radius;

  const WaveImage(
      {Key? key,
      required this.imageUrl,
      required this.speed,
      required this.boarderColor,
      required this.boarderWidth,
      required this.imageSize,
      required this.radius,
      required this.waveColor})
      : super(key: key);

  @override
  _WaveImageState createState() => _WaveImageState();
}

class _WaveImageState extends State<WaveImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: Duration(milliseconds: widget.speed),
    )..repeat();
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation:
          CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
      builder: (context, child) {
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildContainer(widget.radius * _controller.value),
              Container(
                height: widget.imageSize,
                width: widget.imageSize,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: widget.boarderColor, width: widget.boarderWidth),
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.imageSize)),
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.imageSize)),
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.waveColor.withOpacity(1 - _controller.value),
      ),
    );
  }
}
