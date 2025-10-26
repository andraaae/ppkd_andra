import 'package:flutter/material.dart';
import 'package:ppkd_andra/tugas11/login2/login_2.dart';
import 'package:ppkd_andra/tugas11/sign%20up%20screen/sign_up.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  bool obscure = false;
  bool isVisible = false;
  bool isbuttonenable = false;
  bool _obscurePass = true;
  bool isPassword = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  void checkformField(){
    setState(() {
      isbuttonenable = 
      emailController.text.isNotEmpty &&
      usernameController.text.isNotEmpty &&
       passwordController.text.isNotEmpty;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF84994F),
      body: Padding(padding: EdgeInsets.all(15),
      child: Form(key: formKey,
      child: ListView(children: [TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          labelText: 'Please input your email to access',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
                    return 'Email must contain @';
                  } else if (!value.contains('@')) {
                    return 'Email is invalid';
                  } else if (!RegExp(
                    r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                  ).hasMatch(value)) {
                    return 'Format is invalid';
                  }
                  return null;
        },
      ),SizedBox(height: 16),
      TextFormField(
        controller: usernameController,
        decoration: InputDecoration(
          labelText: 'Username',
          border: OutlineInputBorder(),
        ),
        validator: (value){
          if (value == null  || value.isEmpty) {
            return 'Please input username';
          } 
          return null;
        },
      ),
      SizedBox(height: 16),
       TextFormField(
        obscureText: _obscurePass,
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePass ? Icons.visibility_off : Icons.visibility),
                    onPressed: (){
                      setState(() {
                        _obscurePass = !_obscurePass;
                      });
                    })
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password can not be empty';
                  } else if (value.length < 7) {
                    return 'Minimal password length 7 characters';
                  }
                  return null;
                },
              ),
             
            ],
          ),
        ),
      )
    );
  }
}