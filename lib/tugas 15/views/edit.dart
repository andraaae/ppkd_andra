import 'package:flutter/material.dart';
import 'package:ppkd_andra/login/preference_handler.dart';
import 'package:ppkd_andra/tugas 15/service/api.dart';
import 'package:ppkd_andra/tugas%2015/models/profilemodel.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  static const id = "/edit_profile";

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    nameController.text = await PreferenceHandler.getUsername() ?? "";
    emailController.text = await PreferenceHandler.getEmail() ?? "";
  }

  Future<void> saveProfile() async {
    setState(() => isLoading = true);

    try {

      final result = await AuthAPI.editUserProfile(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
      );

      await PreferenceHandler.saveUsername(
        result.data?.name ?? nameController.text,
      );
      await PreferenceHandler.saveEmail(
        result.data?.email ?? emailController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result.message ?? "Profile updated successfully"),
        ),
      );

      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Profile()));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCBF3BB),
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                label: Text("Name"),
                filled: true,
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                label: Text("Email"),
                filled: true,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : saveProfile,
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Save Changes"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
