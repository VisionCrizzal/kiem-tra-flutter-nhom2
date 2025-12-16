import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, dynamic> user;

  const ProfilePage({super.key, required this.user});

  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("user");

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  Widget infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông tin cá nhân"),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => logout(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundImage: NetworkImage(user["image"] ?? ""),
            ),
            const SizedBox(height: 15),

            Text(
              "${user['firstName']} ${user['lastName']}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Card thông tin
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    infoRow("Username", user['username'] ?? ""),
                    infoRow("Email", user['email'] ?? ""),
                    infoRow("Gender", user['gender'] ?? ""),
                    const Divider(),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton.icon(
              icon: const Icon(Icons.logout),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 246, 119, 110),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
              ),
              label: const Text(
                "Đăng xuất",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () => logout(context),
            ),
          ],
        ),
      ),
    );
  }
}
