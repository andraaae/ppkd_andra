import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ppkd_andra/firebase/models/user_firebase_model.dart';
import 'package:ppkd_andra/firebase/service/firebase.dart';
import 'package:ppkd_andra/firebase/views/login_screen.dart';
import 'package:ppkd_andra/login/preference_handler.dart';
import 'package:ppkd_andra/tugas%2015/views/login_screen.dart';

class RegisterScreenFirebase extends StatefulWidget {
  const RegisterScreenFirebase({super.key});
  static const id = "/register_RegisterScreenFirebase";

  @override
  State<RegisterScreenFirebase> createState() => _RegisterScreenFirebaseState();
}

class _RegisterScreenFirebaseState extends State<RegisterScreenFirebase> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisible = false;
  bool isLoading = false;
  UserFirebaseModel? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCBF3BB),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                Text('Register nows', style: TextStyle(fontSize: 20)),

                SizedBox(height: 29),
                // Username
                Align(alignment: Alignment.centerLeft, child: Text('Username')),
                SizedBox(height: 7),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'What do we call you?',
                    hintStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 15),
                // Email
                Align(alignment: Alignment.centerLeft, child: Text('Email')),
                SizedBox(height: 7),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Please input email',
                    hintStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.mail),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    } else if (!value.contains('@')) {
                      return 'Email is invalid';
                    } else if (!RegExp(
                      r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                    ).hasMatch(value)) {
                      return 'Email format is invalid';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 15),
                // Password
                Align(alignment: Alignment.centerLeft, child: Text('Password')),
                SizedBox(height: 7),
                TextFormField(
                  controller: passwordController,
                  obscureText: !isVisible,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Please input password',
                    hintStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty';
                    } else if (value.length < 7) {
                      return 'Minimum password length 7 characters';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 40),
                isLoading
                    ? CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffB3E2A7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text('Register'),
                          onPressed: () async {
                            if (!formKey.currentState!.validate()) {
                              Fluttertoast.showToast(
                                msg: "Please fill all fields correctly",
                              );
                              return;
                            }

                            setState(() {
                              isLoading = true;
                            });

                            try {
                              // Mendaftarkan user di Firebase
                              final result = await FirebaseService.registerUser(
                                email: emailController.text.trim(),
                                username: nameController.text.trim(),
                                password: passwordController.text.trim(),
                              );

                              setState(() {
                                user = result;
                                isLoading = false;
                              });

                              if (user?.uid != null) {
                                await PreferenceHandler.saveToken(user!.uid!);
                              }

                              Fluttertoast.showToast(
                                msg: "Register successful",
                              );

                              // Pindah ke LoginScreen setelah selesai
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreenFirebase(),
                                ),
                              );
                            } catch (e) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(msg: e.toString());
                            }
                          },
                        ),
                      ),

                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Login here",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFADD899),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
