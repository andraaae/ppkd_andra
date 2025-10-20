import 'package:flutter/material.dart';
import 'package:ppkd_andra/slicing/home_screen.dart';
import 'package:ppkd_andra/tugas4/tugas4.dart';
import 'package:ppkd_andra/tugas5/tugas5.dart';

class ButtonNavigation extends StatefulWidget {
  const ButtonNavigation({super.key});

  @override
  State<ButtonNavigation> createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [HomeScreen(), Tugas5(), Tugas4()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          print(index);
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "School"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
