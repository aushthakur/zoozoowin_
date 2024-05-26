import 'package:flutter/material.dart';

class Game1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the current hour in Indian time zone
    int currentHour = DateTime.now().toUtc().add(Duration(hours: 5, minutes: 30)).hour;

    // Define the time slots
    List<String> timeSlots = [
      '10 AM', '11 AM', '12 PM', '1 PM', '2 PM', '3 PM', 
      '4 PM', '5 PM', '6 PM', '7 PM', '8 PM', '9 PM', '10 PM', '11 PM', '12 AM'
    ];

    // Define the background image for each time slot
    List<String> slotImages = List.generate(timeSlots.length, (index) {
      return index < currentHour - 10 ? 'assets/images/redslot.png' : 'assets/images/greenslot.png';
    });

    // Define the container style for each time slot
    List<Widget> timeSlotWidgets = List.generate(timeSlots.length, (index) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 2), // Adjust vertical margin here
        child: Image.asset(
          slotImages[index],
          width: 180,
          height: 80,
        ),
      );
    });

    // Create two columns of time slots
    Widget timeSlotsColumn1 = Column(
      children: timeSlotWidgets.getRange(0, 6).toList(),
    );

    Widget timeSlotsColumn2 = Column(
      children: timeSlotWidgets.getRange(6, 12).toList(),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 4, 26, 191),
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
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/redbg.png'),
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
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: kToolbarHeight + 60,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                timeSlotsColumn1,
                timeSlotsColumn2,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
