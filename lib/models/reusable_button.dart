import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  final double width;
  final double height;
  final ShapeBorder shapeBorder;
  final Color fillColor;

  const ReusableButton({
    @required this.onPressed,
    @required this.child,
    this.width = 40.0,
    this.height = 40.0,
    this.shapeBorder = const CircleBorder(),
    this.fillColor = const Color(0xFF4C4F5E),
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: shapeBorder,
      fillColor: fillColor,
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      child: child,
      onPressed: onPressed,
    );
  }
}
