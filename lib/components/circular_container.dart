import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  final Widget? child;
  final double padding;
  final double? width;
  final double? height;
  final double radius;
  final EdgeInsets? margin;
  final Color backgroundColor;

  const CircularContainer(
      {super.key,
      this.child,
      this.padding = 0,
      this.width = 400,
      this.height = 400,
      this.radius = 400,
      this.margin,
      this.backgroundColor = Colors.white10,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
