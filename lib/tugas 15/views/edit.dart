import 'package:flutter/material.dart';
import 'package:ppkd_andra/login/preference_handler.dart';

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

  void saveProfile() async {
    setState(() => isLoading = true);

    await PreferenceHandler.saveUsername(nameController.text);
    await PreferenceHandler.saveEmail(emailController.text);

    setState(() => isLoading = false);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Profile updated!")));

    Navigator.pop(context, true); // ← memberi sinyal ke HomeScreen
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
