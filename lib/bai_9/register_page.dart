import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmController = TextEditingController();

  bool hidePass = true;
  bool hideConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đăng ký tài khoản"),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Họ tên
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Họ tên",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) =>
                        v!.isEmpty ? "Vui lòng nhập họ tên" : null,
                  ),
                  const SizedBox(height: 16),

                  // Email
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) {
                      if (v!.isEmpty) return "Vui lòng nhập email";
                      if (!v.contains("@") || !v.contains(".")) {
                        return "Email không hợp lệ";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Mật khẩu
                  TextFormField(
                    controller: passController,
                    obscureText: hidePass,
                    decoration: InputDecoration(
                      labelText: "Mật khẩu",
                      prefixIcon: const Icon(Icons.lock),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          hidePass ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () => setState(() {
                          hidePass = !hidePass;
                        }),
                      ),
                    ),
                    validator: (v) =>
                        v!.length < 6 ? "Mật khẩu phải >= 6 ký tự" : null,
                  ),
                  const SizedBox(height: 16),

                  // Xác nhận mật khẩu
                  TextFormField(
                    controller: confirmController,
                    obscureText: hideConfirm,
                    decoration: InputDecoration(
                      labelText: "Xác nhận mật khẩu",
                      prefixIcon: const Icon(Icons.lock_outline),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          hideConfirm ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () => setState(() {
                          hideConfirm = !hideConfirm;
                        }),
                      ),
                    ),
                    validator: (v) {
                      if (v!.isEmpty) return "Vui lòng nhập lại mật khẩu";
                      if (v != passController.text) {
                        return "Mật khẩu không khớp";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  // Button đăng ký
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Đăng ký thành công!"),
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.person_add),
                      label: const Text("Đăng ký"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          255,
                          255,
                          255,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
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
