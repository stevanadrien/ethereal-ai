import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      backgroundColor: Color(0xFF008000), // Green background
      selectedItemColor: Colors.white, // White selected text
      unselectedItemColor: Colors.white70, // Lighter white for unselected text
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.white),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant, color: Colors.white),
          label: 'Mindful Pantry',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart, color: Colors.white),
          label: 'Food Rescue',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people, color: Colors.white),
          label: 'GroceryGo',
        ),
      ],
    );
  }
}
