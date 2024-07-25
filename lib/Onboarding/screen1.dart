import 'package:flutter/material.dart';
import 'package:smartfin_guide/Authentication/MainAuth.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/i1.png',
                    height: MediaQuery.of(context).size.width * 0.7,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Navigate your financial journey with personalized guidance and expert advice from your trusted SmartFin Guide.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                       color: Color.fromARGB(255, 165, 159, 173), // Red color for text
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 36),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () {
                 Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 400),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: HomePage(),
                      );
                    },
                  ),
                );
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.grey[800], // Dark grey text color
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
