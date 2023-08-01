import 'package:flutter/material.dart';
class TelebirrFooter extends StatelessWidget {
  TelebirrFooter(
      {super.key,
      required this.size,
      this.onTap,
      this.image,
      this.text1,
      this.color,
      this.text2});

  final Size size;
  final Function()? onTap;
  final String? text1;
  final String? image;
  final Color? color;
  final String? text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 1,
          ),
        ],
      ),
      height: size.height * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image!,
            height: 50,
            width: 50,
            color: color!,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              text1!,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          InkWell(
            onTap: onTap!,
           
            child: Text(
              text2!,
              style: const TextStyle(
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
