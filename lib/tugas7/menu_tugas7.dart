import 'package:flutter/material.dart';
import 'package:ppkd_andra/tugas7/tugas7.dart';

class menuTugas7 extends StatefulWidget {
  const menuTugas7({super.key});

  @override
  State<menuTugas7> createState() => _menuTugas7State();
}

class _menuTugas7State extends State<menuTugas7> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [Tugas7(), Switch7(), dropDown7()];

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
                backgroundImage: AssetImage("assets/images/Google.png"),
              ),
              title: Text("Habibie"),
              subtitle: Text("Instruktur PPKD"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.check_box),
              title: Text("Checkbox"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.switch_access_shortcut),
              title: Text("switch"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.category),
              title: Text("kategori"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(3);
              },
              leading: Icon(Icons.date_range),
              title: Text("tanggal"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(4);
              },
              leading: Icon(Icons.date_range),
              title: Text("Date"),
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
