import 'dart:async';
import 'package:flutter/material.dart';

import 'bmi_calculator_home_screen.dart';

class SplashScreenBmi extends StatefulWidget {
  const SplashScreenBmi({super.key});
  @override
  State<SplashScreenBmi> createState() => _SplashScreenBmiState();
}

class _SplashScreenBmiState extends State<SplashScreenBmi> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(
          seconds: 4,
        ),
        () => Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return const BmiCalculatorHomeScreen();
              },
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "الشوربجي",
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.15),
          const Text(
            "BMI CALCULATOR",
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.1),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Image.asset(
              "images/bmi3.png",
              fit: BoxFit.fill,
            ),
          ),
        ],
      )),
    );
  }
}
