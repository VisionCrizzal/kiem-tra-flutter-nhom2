import 'package:flutter/material.dart';

import 'package:flutter_application_13/bai_1/bai_1.dart';
import 'package:flutter_application_13/bai_2/bai_2.dart';
import 'package:flutter_application_13/bai_3/bai_3.dart';
import 'package:flutter_application_13/bai_4/bai_4.dart';
import 'package:flutter_application_13/bai_5/bai_5.dart';
import 'package:flutter_application_13/bai_6/bai_6.dart';
import 'package:flutter_application_13/bai_7/bai_7.dart';
import 'package:flutter_application_13/bai_8/bai_8.dart';
import 'package:flutter_application_13/bai_9/login_page_1.dart';
import 'package:flutter_application_13/bai_10/my_product.dart';
import 'package:flutter_application_13/bai_11/pages/news_list_screen.dart';
import 'package:flutter_application_13/bai_12/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assignments',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _go(BuildContext context, Widget page) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Assignments"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.lightBlueAccent],
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.flutter_dash, size: 42, color: Colors.blue),
              ),
              accountName: const Text("Flutter UI & API Demo"),
              accountEmail: const Text("Single main.dart • Multiple modules"),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _section("BASIC WIDGETS"),
                  _item(
                    context,
                    icon: Icons.place,
                    text: "Lesson 1 - My Place",
                    page: MyPlace(),
                  ),
                  _item(
                    context,
                    icon: Icons.waving_hand,
                    text: "Lesson 2 - Welcome Screen",
                    page: WelcomeScreen(),
                  ),
                  _item(
                    context,
                    icon: Icons.school,
                    text: "Lesson 3 - Classroom Layout",
                    page: Classroom(),
                  ),
                  _section("STATE & INTERACTION"),
                  _item(
                    context,
                    icon: Icons.exposure_plus_1,
                    text: "Lesson 4 - Counter App",
                    page: CounterApp(),
                  ),
                  _item(
                    context,
                    icon: Icons.timer,
                    text: "Lesson 5 - Timer App",
                    page: TimerApp(),
                  ),
                  _item(
                    context,
                    icon: Icons.palette,
                    text: "Lesson 6 - Color Changer",
                    page: DoiMauScreen(),
                  ),
                  _item(
                    context,
                    icon: Icons.login,
                    text: "Lesson 7 - Login & Register",
                    page: LoginPage1(),
                  ),
                  _item(
                    context,
                    icon: Icons.feedback_outlined,
                    text: "Lesson 8 - Feedback Form",
                    page: FeedbackForm(),
                  ),
                  _item(
                    context,
                    icon: Icons.monitor_weight_outlined,
                    text: "Lesson 9 - BMI Calculator",
                    page: BMIScreen(),
                  ),
                  _section("API & NETWORK"),
                  _item(
                    context,
                    icon: Icons.shopping_cart_outlined,
                    text: "Lesson 10 - Product API",
                    page: Myproduct(),
                  ),
                  _item(
                    context,
                    icon: Icons.newspaper_outlined,
                    text: "Lesson 11 - News API",
                    page: NewsListPage(),
                  ),
                  _item(
                    context,
                    icon: Icons.security,
                    text: "Lesson 12 - Login API",
                    page: LoginPage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu, size: 64, color: Colors.blue),
            SizedBox(height: 16),
            Text(
              "Open the menu on the left 👈\nSelect a lesson to explore",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _section(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    required IconData icon,
    required String text,
    required Widget page,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(text),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => _go(context, page),
    );
  }
}
