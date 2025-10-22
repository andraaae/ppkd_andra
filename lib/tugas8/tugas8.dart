import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ppkd_andra/tugas7/menu_tugas7.dart';
import 'package:ppkd_andra/tugas7/tugas7_2.dart';

class ButtomNav extends StatefulWidget {
  const ButtomNav({super.key});

  @override
  State<ButtomNav> createState() => _ButtomNav();
}

class _ButtomNav extends State<ButtomNav> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [menuTugas7(), Tugas7_2()];
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_accessibility),
            label: 'About aplication',
          ),
        ],
      ),
    );
  }
}
