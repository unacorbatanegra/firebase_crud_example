import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/widgets.dart';

class Button extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  const Button({
    Key key,
    @required this.onTap,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(blurRadius: 5, offset: Offset(2, 2), color: Colors.grey)
          ],
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 6),
            SvgPicture.asset(
              "assets/images/google.svg",
              height: 30,
              width: 30,
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style:const  TextStyle(
                fontSize: 20.0,
                color: Palette.accent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
