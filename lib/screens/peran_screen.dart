import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import the HomeScreen class
import 'penjual_verification_screen.dart'; // Import the PenjualVerificationScreen class

class PeranScreen extends StatelessWidget {
  static const backgroundColor = Color(0xFF0A6847);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            // Handle back button press (e.g., navigate back)
          },
        ),
        title: Center(
          child: Text(
            'Food Rescue',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/user_profile.png'), // Replace with your user profile image path
            radius: 25,
          ),
        ],
        backgroundColor: backgroundColor,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Peran kamu di sini sebagai...',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PenjualVerificationScreen()), // Navigate to PenjualVerificationScreen
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120, 90), // Set the minimum size to 120x90 (4:3 ratio)
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.store, size: 24, color: Colors.black), // Add a restaurant icon
                        SizedBox(height: 5),
                        Text('PELAKU USAHA', style: TextStyle(fontFamily: 'Poppins')),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()), // Navigate to HomeScreen
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 90), // Set the minimum size to 120x90 (4:3 ratio)
                      backgroundColor: backgroundColor, // Set the background color to 0A6847
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.person, size: 24, color: Colors.white), // Add a restaurant icon
                        SizedBox(height: 5),
                        Text('KONSUMEN', style: TextStyle(fontFamily: 'Poppins')),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
