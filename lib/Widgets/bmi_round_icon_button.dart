import 'package:flutter/material.dart';

// import 'package:bmi_calculator/constants.dart';
class RoundIconButton extends StatelessWidget {
  // const RoundIconButton({Key? key}) : super(key: key);
  const RoundIconButton({super.key, required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      constraints:const BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      shape: const CircleBorder(),
      fillColor:const Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
