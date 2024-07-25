// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smartfin_guide/Authentication/LoginPage.dart';
import 'package:smartfin_guide/Authentication/signup.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SECRET',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.22,
                color: Colors.white,
              ),
            ),
            Text(
              'CREDIT HACKS',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.12,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.13,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Our app is the perfect way to stay up to date with your cases on time.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon('assets/google.png', () {
                  print('Google clicked');
                }),
                SizedBox(width: 20),
                _buildSocialIcon('assets/facebook.png', () {
                  print('Facebook clicked');
                }),
                SizedBox(width: 20),
                _buildSocialIcon('assets/apple.png', () {
                  print('Apple clicked');
                }),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    thickness: 1,
                    indent: 16,
                    endIndent: 8,
                  ),
                ),
                Text(
                  'OR',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    thickness: 1,
                    indent: 8,
                    endIndent: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: screenWidth * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SignUpPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
                  },
                  child: Text('Sign Up'),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                'Existing Account? Log in',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String imagePath, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(0), // Adjust the padding as needed
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
