import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulasi delay untuk splash screen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SIAGAKU',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                ClipOval(
                  child: Container(
                    width: 200,
                    height: 50,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: -70,
              left: 0,
              right: -250,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  shape: BoxShape.circle, // bentuk lingkaran
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              top: -900,
              left: -100,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  shape: BoxShape.circle, // bentuk lingkaran
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
