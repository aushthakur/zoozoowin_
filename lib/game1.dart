import 'package:flutter/material.dart';

class Game1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 26, 191), // Same color as in HomeScreen
        title: Image.asset(
          'assets/images/logo.png',
          width: 150,
          height: 110,
          fit: BoxFit.contain,
        ),
        actions: [
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
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 255, 255, 255), // Change the color of the back arrow here
        ),
      ),
      body: Stack(
        children: [
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
          Positioned(
            top: kToolbarHeight - 30,
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 4, 26, 191),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'PICK A TIME SLOT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26, // Adjust size as needed
                          fontWeight: FontWeight.bold, // Set font weight to bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
