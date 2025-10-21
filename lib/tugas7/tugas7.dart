import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    return Column(
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
      ],
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

class DatePickerWidgetDay16 extends StatefulWidget {
  const DatePickerWidgetDay16({super.key});

  @override
  State<DatePickerWidgetDay16> createState() => _DatePickerWidgetDay16State();
}

class _DatePickerWidgetDay16State extends State<DatePickerWidgetDay16> {
  DateTime? selectedPicked = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(DateFormat('EEEE, MMMM-yyyy', "id_ID").format(selectedPicked!)),

        ElevatedButton(
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
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
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(DateFormat.EEEE('yyyy-MM-dd').format(selectedPicked!)),
          ],
        ),
      ],
    );
  }
}

//5
class TimePickerWidgetDay16 extends StatefulWidget {
  const TimePickerWidgetDay16({super.key});

  @override
  State<TimePickerWidgetDay16> createState() => _TimePickerWidgetDay16State();
}

class _TimePickerWidgetDay16State extends State<TimePickerWidgetDay16> {
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
