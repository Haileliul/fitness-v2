import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomnavigationBar extends StatelessWidget {
  const BottomnavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
      color: Colors.grey,
      duration: const Duration(milliseconds: 200),
      gap: 12.0,
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      tabBorderRadius: 20.0,
      tabs: [
        GButton(
          icon: FontAwesomeIcons.house,
          text: 'Home',
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/Main');
          },
        ),
        GButton(
          icon: FontAwesomeIcons.solidMessage,
          text: 'Chat',
          onPressed: () {
            Navigator.pushNamed(context, '/chat');
          },
        ),
        GButton(
          margin: const EdgeInsets.all(0),
          gap: 5.0,
          icon: FontAwesomeIcons.calculator,
          text: 'BMI',
          onPressed: () {
            Navigator.pushNamed(context, '/Bmi');
          },
        ),
        GButton(
          icon: FontAwesomeIcons.dumbbell,
          text: 'Workouts',
          onPressed: () {
            Navigator.pushNamed(context, '/Payment');
          },
        ),
      ],
    );
  }
}
