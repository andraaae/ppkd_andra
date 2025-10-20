import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ppkd_andra/slicing/home_screen.dart';
import 'package:ppkd_andra/tugas4/tugas4.dart';
import 'package:ppkd_andra/tugas5/tugas5.dart';

class BottomNavCustomDay15 extends StatefulWidget {
  const BottomNavCustomDay15({super.key});

  @override
  State<BottomNavCustomDay15> createState() => _BottomNavCustomDay15State();
}

class _BottomNavCustomDay15State extends State<BottomNavCustomDay15> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    HomeScreen(),
    Tugas5(),
    Tugas4(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Bottom Navigation")),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueGrey,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          print(index);
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}