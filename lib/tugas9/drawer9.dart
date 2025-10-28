import 'package:flutter/material.dart';
import 'package:ppkd_andra/tugas9/listmap.dart';
import 'package:ppkd_andra/tugas9/listmodel.dart';
import 'package:ppkd_andra/tugas9/listviewbuilder.dart';

class Drawer9 extends StatefulWidget {
  const Drawer9({super.key});

  @override
  State<Drawer9> createState() => _Drawer9State();
}

class _Drawer9State extends State<Drawer9> {
  int _selectedIndex = 0;
  static const List<String> _tittles = [
    'List View',
    'List View Map',
    'List View Model',
  ];
  static const List<Widget> _widgetOptions = [
    ListviewBuilder(),
    Listmap(),
    Listmodel(),
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
      appBar: AppBar(
        title: Text(_tittles[_selectedIndex]),
        backgroundColor: Color(0xff708993),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(leading: CircleAvatar(
              backgroundImage: AssetImage('assets/LK.jpg'),
            ),
            title: Text('Hellow Andra'),
            subtitle: Text('Welcome'),
          ),
          Divider(),
          ListTile(
            onTap: () {
              onTapDrawer(0);
            },
            leading: Icon(Icons.list),
            title: Text('List View'),
          ),
          Divider(),
          ListTile(
            onTap: () {
              onTapDrawer(1);
            },
            leading: Icon(Icons.list_alt),
            title: Text('List View Map'),
          ),
          Divider(),
          ListTile(
            onTap: () {
              onTapDrawer(2);
            },
            leading: Icon(Icons.list_sharp),
            title: Text('List View Model'),
          )
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}