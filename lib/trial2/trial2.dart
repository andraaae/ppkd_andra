import 'package:flutter/material.dart';

class Tugas7 extends StatefulWidget {
  const Tugas7({super.key});

  @override
  State<Tugas7> createState() => _Tugas7State();
}

class _Tugas7State extends State<Tugas7> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/Apple Logo.png"),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Checkbox(
            value: isChecked1,
            onChanged: (value) {
              print(value);
              setState(() {
                isChecked1 = value!;
              });
            },
          ),
          Text(
            isChecked1
                ? "Apakah Anda setuju dengan syarat dan ketentuan yang berlaku? "
                : "Apakah Anda setuju dengan persyaratan di atas?",
          ),
          Checkbox(
            value: isChecked2,
            onChanged: (value) {
              print(value);
              setState(() {
                isChecked2 = value!;
              });
            },
          ),
          Text(
            isChecked2
                ? "Pendaftaran diperbolehkan"
                : " Anda belum bisa melanjutkan",
          ),
          Column(
            children: [
              SwitchListTile(
                title: Text("Aktifkan mode gelap"),
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
                activeTrackColor: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
