import 'package:flutter/material.dart';

/// Flutter code sample for [AnimatedIcon].

class AnimatedIconExample extends StatefulWidget {
  const AnimatedIconExample({super.key});

  @override
  State<AnimatedIconExample> createState() => _AnimatedIconExampleState();
}

class _AnimatedIconExampleState extends State<AnimatedIconExample>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
        /* ..forward()
      ..repeat(reverse: true) */
        ;
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: InkWell(
        onTap: () {
          print("Haile");
        },
        child: CircleAvatar(
          backgroundColor: Colors.white,
          foregroundColor: const Color.fromARGB(255, 245, 16, 0),
          radius: 25,
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: animation,
            size: 40.0,
            semanticLabel: 'Show menu',
          ),
        ),
      ),
    );
  }
}
