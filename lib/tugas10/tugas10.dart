import 'package:flutter/material.dart';
import 'package:ppkd_andra/tugas10/konfirmasi_10.dart';

class Tugas10 extends StatefulWidget {
  const Tugas10({super.key});
  static const id = "/login_screen";

  @override
  State<Tugas10> createState() => _Tugas10State();
}

class _Tugas10State extends State<Tugas10> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  bool isVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form")),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Please input your name to access',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama wajib diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email harus mengandung @';
                  } else if (!value.contains('@')) {
                    return 'Email tidak valid';
                  } else if (!RegExp(
                    r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                  ).hasMatch(value)) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  } else if (value.length < 7) {
                    return 'Password minimal 7 karakter';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor Handphone tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: cityController,
                decoration: InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Domisili wajib diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print(emailController.text);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Validation Success"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Name ${nameController.text}"),
                              Text("Email ${emailController.text}"),
                              Text("Password ${passwordController.text}"),
                              Text("Phone ${phoneController.text}"),
                              Text("City ${cityController.text}"),
                            ],
                          ),
                          actions: [
                            TextButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Konfirmasi_10(
                                      name: nameController.text,
                                      city: cityController.text,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {}
                },
                child: Text("Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Konfirmasi_10 extends StatelessWidget {
  final String name;
  final String city;

  const Konfirmasi_10({super.key, required this.name, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Confirmed")),
      body: Center(
        child: Text(
          "Thank you, $name from $city for signing up.",
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
