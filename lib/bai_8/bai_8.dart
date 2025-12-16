import 'package:flutter/material.dart';
import 'dart:math';

class DoiMauNenApp extends StatelessWidget {
  const DoiMauNenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ứng dụng Đổi màu nền',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const DoiMauScreen(),
    );
  }
}

class DoiMauScreen extends StatefulWidget {
  const DoiMauScreen({super.key});

  @override
  State<DoiMauScreen> createState() => _DoiMauScreenState();
}

class _DoiMauScreenState extends State<DoiMauScreen> {
  Color currentColor = Colors.purple;
  String colorName = 'Tím';

  final Map<Color, String> colorMap = {
    Colors.red: 'Đỏ',
    Colors.green: 'Xanh lá',
    Colors.blue: 'Xanh dương',
    Colors.orange: 'Cam',
    Colors.yellow: 'Vàng',
    Colors.purple: 'Tím',
    Colors.pink: 'Hồng',
    Colors.teal: 'Xanh ngọc',
    Colors.brown: 'Nâu',
  };

  void changeColor() {
    final random = Random();
    final colors = colorMap.keys.toList();
    final newColor = colors[random.nextInt(colors.length)];
    setState(() {
      currentColor = newColor;
      colorName = colorMap[newColor]!;
    });
  }

  void resetColor() {
    setState(() {
      currentColor = Colors.purple;
      colorName = 'Tím';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentColor,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          '🎨 Ứng dụng Đổi màu nền',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Màu hiện tại',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              colorName,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: changeColor,
                  icon: const Icon(Icons.palette),
                  label: const Text('Đổi màu'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: resetColor,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Đặt lại'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
