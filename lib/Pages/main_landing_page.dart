import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Provider/exercises_categories.dart';
import 'bmi_input_page.dart';
import 'chatbot.dart';
import 'maincategoryPage.dart';
import 'payment_gateway.dart';

class MainLandingPage extends StatefulWidget {
  const MainLandingPage({Key? key}) : super(key: key);

  @override
  State<MainLandingPage> createState() => _MainLandingPageState();
}

class _MainLandingPageState extends State<MainLandingPage> {
  late int _currentIndex;
  final List<Widget> _screens = [
   const MainCategory(),
    Chatbot(),
    const InputPage(),
    const PaymentGatewayScreen(),
  ];
  void initState() {
    _currentIndex = 0;
    super.initState();
  }

  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose(); // Dispose the focus node to avoid memory leaks
    super.dispose();
  }

  var productState;
  var productUpdate;
  @override
  Widget build(BuildContext context) {
    productState = Provider.of<ExerciseCategories>(context);
    productUpdate = Provider.of<ExerciseCategories>(context, listen: false);
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: GNav(
        gap: 5,
        // iconSize: 30,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        backgroundColor: Theme.of(context).colorScheme.background,
        color: Colors.white,
        activeColor: Colors.amber,

        tabs: [
          GButton(
            icon: FontAwesomeIcons.house,
            text: "Home",
            onPressed: () {
              setState(() {
                _currentIndex = 0;
              });
            },
          ),
          GButton(
            icon: FontAwesomeIcons.solidMessage,
            text: "Match",
            onPressed: () {
              setState(() {
                _currentIndex = 1;
              });
            },
          ),
          GButton(
            icon: FontAwesomeIcons.calculator,
            text: "Leaders",
            onPressed: () {
              setState(() {
                _currentIndex = 2;
              });
            },
          ),
          GButton(
            icon: FontAwesomeIcons.dumbbell,
            text: "Liberary",
            onPressed: () {
              setState(() {
                _currentIndex = 3;
              });
            },
          ),
        ],
      ),
    );
  }
}
