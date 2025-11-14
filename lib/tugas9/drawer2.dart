import 'package:flutter/material.dart';
import 'package:ppkd_andra/tugas9/tugas9.dart';

class Drawer2 extends StatefulWidget {
  const Drawer2({super.key});

  @override
  State<Drawer2> createState() => _Drawer2State();
}

class _Drawer2State extends State<Drawer2> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    //Center(child: Text("Home"),)
    Tugas9(),
    
  ];
  void onTapDrawer(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/sun.jpeg'),
              ),
              title: Text("admin"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.home),
              title: Text("Rumah"),
            ),
            Divider(),
            // ListTile(
            //   onTap: () {
            //     onTapDrawer(1);
            //   },
            //   leading: Icon(Icons.gesture),
            //   title: Text("iya"),
            // ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
