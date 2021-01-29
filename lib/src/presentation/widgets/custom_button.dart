import 'package:flutter/material.dart';

import 'widgets.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color color;
  const CustomButton({
    Key key,
    this.label,
    this.onPressed,
    this.height = 48,
    this.width = 223,
    this.color = Palette.accent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.0,
      child: Center(
        child: InkWell(
          onTap: onPressed,
          child: Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
