import 'package:flutter/material.dart';
import 'package:ppkd_andra/login/preference_handler.dart';
import 'package:ppkd_andra/login_2/login_2.dart';
import 'package:ppkd_andra/trial3/trial3/database/dbhelper.dart';
import 'package:ppkd_andra/trial3/trial3/view3/login_screen2.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({
    super.key,
    required this.id,
    required this.name,
    required this.email,
    required this.city,
    });
    final String id;
    final String name;
    final String email;
    final String city;
    
    
    
  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hi! ${widget.name}')),
      body: Padding(padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Welcome!', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 11),
          const Text('This is your information:'),
          Text('Name : ${widget.name}'),
          Text('Email : ${widget.email}'),
          SizedBox(height: 32),
      TextButton(onPressed: (){
        PreferenceHandler.removeLogin();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginScreen2()), (route) => false,
        );
      },
      child: Text('Logout'),
        )
      ]
    )
  )
);
        
    
  }
  }