import 'package:flutter/material.dart';
import 'register_page.dart';

class LoginPage1 extends StatefulWidget {
  const LoginPage1({super.key});
  @override
  State<LoginPage1> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _obscurePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("From đăng nhập"),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _userController,
                  decoration: const InputDecoration(
                    labelText: "Tên người dùng",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập tên người dùng";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passController,
                  obscureText: _obscurePass,
                  decoration: InputDecoration(
                    labelText: "Mật khẩu",
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePass ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePass = !_obscurePass;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập mật khẩu";
                    }
                    if (value.length < 6) {
                      return "Mật khẩu phải >= 6 ký tự";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Đăng nhập thành công")),
                        );
                      }
                    },
                    child: const Text("Đăng nhập"),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text("Chưa có tài khoản?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Đăng ký",
                        style: TextStyle(color: Colors.blue),
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
