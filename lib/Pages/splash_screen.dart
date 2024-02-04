import 'dart:async';

import '../Provider/exercises_categories.dart';
import 'login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, "/Login");
    });
  }

  var productState;
  var productUpdate;
  @override
  Widget build(BuildContext context) {
    productState = Provider.of<ExerciseCategories>(context);
    productUpdate = Provider.of<ExerciseCategories>(context, listen: false);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromRGBO(1, 1, 1, 0.92),
              Color.fromRGBO(246, 30, 0, 0.82),
            ],
            stops: [
              0.0176,
              0.8733,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/fitness-sport-gym-logo-real - Copy.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
