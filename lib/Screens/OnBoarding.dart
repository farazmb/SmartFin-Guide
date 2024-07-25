// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:smartfin_guide/Onboarding/screen1.dart';
import 'package:smartfin_guide/Onboarding/screen2.dart';
import 'package:smartfin_guide/Onboarding/screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Screen1(),
              Screen2(),
              Screen3(),
            ],
          ),

          // Dot indicator positioned at the bottom center of the screen
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.05, // 5% from the bottom
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: WormEffect(), // Choose your preferred effect
              ),
            ),
          ),
        ],
      ),
    );
  }
}
