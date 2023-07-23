import 'package:flutter/material.dart';
import 'package:fitness/constants/bmi_constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomContainerHeight,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF010101),
                Color(0xFFF61E00),
              ],
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: KLargeButtonStyle,
            ),
          ),
        ),
      ),
    );
  }
}
