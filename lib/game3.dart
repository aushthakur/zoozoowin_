import 'package:flutter/material.dart';

class Game1wait extends StatelessWidget {
  const Game1wait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 26, 191),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Your logo widget here
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 110,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            // Your language change icon here
            IconButton(
              icon: Image.asset(
                'assets/images/language_icon.png',
                width: 30,
                height: 30,
              ),
              onPressed: () {
                // Implement language change functionality here
              },
            ),
          ],
        ),
      ),
      
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/redbg.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Centered custom gif
          Center(
            child: Image.asset(
              'assets/images/DOWNLOAD NOW.gif',
              width: 500,
              height: 600,
              // Adjust width and height as needed
            ),
          ),
        ],
      ),
    );
  }
}
