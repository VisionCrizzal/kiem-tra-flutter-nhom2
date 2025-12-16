import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_13/bai_12/profile_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'api_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _showPass = false;
  bool _loading = false;

  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);

    try {
      final data = await ApiService.login(
        _userCtrl.text.trim(),
        _passCtrl.text.trim(),
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("user", jsonEncode(data));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => ProfilePage(user: data)),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Đăng nhập",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: _userCtrl,
                  decoration: const InputDecoration(
                    labelText: "Tên người dùng",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Vui lòng nhập tài khoản" : null,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _passCtrl,
                  obscureText: !_showPass,
                  decoration: InputDecoration(
                    labelText: "Mật khẩu",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showPass ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() => _showPass = !_showPass);
                      },
                    ),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Vui lòng nhập mật khẩu" : null,
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _login,
                    child: _loading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Đăng nhập"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
