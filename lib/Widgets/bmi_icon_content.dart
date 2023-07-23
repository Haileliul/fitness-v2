import 'package:fitness/constants/bmi_constants.dart';
import 'package:flutter/material.dart';
// import 'constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String lable;
  const IconContent({super.key, required this.icon, required this.lable});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          lable,
          style: kLableTextStyle,
        )
      ],
    );
  }
}
