import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ppkd_andra/tugas7/menu_tugas7.dart';
import 'package:ppkd_andra/tugas7/tugas7_2.dart';

class Tugas7 extends StatefulWidget {
  const Tugas7({super.key});

  @override
  State<Tugas7> createState() => _Tugas7State();
}

class _Tugas7State extends State<Tugas7> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: isCheck,
              onChanged: (value) {
                print(value);
                setState(() {
                  isCheck = value!;
                });
              },
            ),
            Text("Saya menyetujui ketentuan yang berlaku"),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: isCheck,
              onChanged: (value) {
                print(value);
                setState(() {
                  isCheck = value!;
                });
              },
            ),
            Text(
              isCheck ? "Lanjutkan pendaftaran" : "Anda belum bisa melanjutkan",
            ),
          ],
        ),
      ],
    );
  }
}

//2
class Switch7 extends StatefulWidget {
  const Switch7({super.key});

  @override
  State<Switch7> createState() => Switch7State();
}

class Switch7State extends State<Switch7> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSwitched ? Colors.black : Colors.white,
      child: Column(
        children: [
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
          Text(
            isSwitched ? "On" : "Off",
            style: TextStyle(color: Colors.blueGrey),
          ),
          Container(
            height: 500,
            width: 500,
            color: isSwitched ? Colors.black : Colors.white,
          ),
        ],
      ),
    );
  }
}

//3
class dropDown7 extends StatefulWidget {
  const dropDown7({super.key});

  @override
  State<dropDown7> createState() => _dropDown7State();
}

class _dropDown7State extends State<dropDown7> {
  String? dropDownValue;
  final List<String> list = ["Mawar", "Melati", "Anggrek"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton(
          value: dropDownValue,
          items: list.map((String val) {
            return DropdownMenuItem(
              value: val,
              child: Text(val, style: TextStyle(color: Colors.black)),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              dropDownValue = value;
            });
            print(dropDownValue);
          },
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Kategori dipilih :"),
            Text(dropDownValue.toString()),
          ],
        ),
      ],
    );
  }
}

//4

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedPicked = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(selectedPicked.toString()),
          Text(DateFormat('EEEE, MMMM-yyyy', "id_ID").format(selectedPicked!)),

          ElevatedButton(
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1800),
                lastDate: DateTime(2111),
              );
              if (picked != null) {
                print(picked);
                setState(() {
                  selectedPicked = picked;
                });
              }
            },
            child: Text("Isi tanggal :"),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Tanggal : $selectedPicked")],
          ),
        ],
      ),
    );
  }
}

//5
class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickertate();
}

class _TimePickertate extends State<TimePicker> {
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (picked != null) {
              print(picked);
              setState(() {
                selectedTime = picked;
              });
            }
          },
          child: Text("Pilih waktu"),
        ),
        SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pengingat diatur pada :"),
            Text(
              selectedTime != null
                  ? selectedTime!.format(context)
                  : "Belum dipilih",
            ),
          ],
        ),
      ],
    );
  }
}

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
