import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ppkd_andra/login/preference_handler.dart';
import 'package:ppkd_andra/tugas 15/service/api.dart';
import 'package:ppkd_andra/tugas 15/views/profile.dart';
import 'package:ppkd_andra/tugas%2015/views/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isVisible = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCBF3BB),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  Center(
                    child: Text(
                      'Welcome back!',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // EMAIL
                  const Text('Email'),
                  const SizedBox(height: 7),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Please input email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.mail),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email cannot be empty';
                      } else if (!value.contains('@')) {
                        return 'Email must contain @';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // PASSWORD
                  const Text('Password'),
                  const SizedBox(height: 7),
                  TextFormField(
                    controller: passwordController,
                    obscureText: !isVisible,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Please input password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
                      } else if (value.length < 7) {
                        return 'Minimum password length is 7 characters';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 40),

                  // LOGIN BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffB3E2A7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });

                          try {
                            final result = await AuthAPI.loginUser(
                              email: emailController.text,
                              password: passwordController.text,
                            );

                            // STOP LOADING
                            setState(() => isLoading = false);

                            // SIMPAN TOKEN
                            // print(result.data!.token);
                            PreferenceHandler.saveToken(result.data!.token!);

                            Fluttertoast.showToast(msg: "Login success!");

                            // PINDAH PAGE SETELAH LOGIN SUKSES
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          } catch (e) {
                            setState(() => isLoading = false);
                            Fluttertoast.showToast(msg: e.toString());
                          }
                        }
                      },
                    ),
                  ),

                  const SizedBox(height: 18),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()
                          )
                          );
                          Navigator.pushNamed(context, "/register_screen");
                        },
                        child: const Text(
                          "Register now",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xffADD899),
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
      ),
    );
  }
}
