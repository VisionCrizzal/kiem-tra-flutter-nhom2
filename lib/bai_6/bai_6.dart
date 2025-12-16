import 'package:flutter/material.dart';
import 'dart:async';

class TimerApp extends StatelessWidget {
  const TimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bộ đếm thời gian',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const TimerScreen(),
    );
  }
}

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  final TextEditingController _controller = TextEditingController();
  Timer? _timer;
  int _seconds = 0;

  void startTimer() {
    if (_controller.text.isEmpty) return;
    int totalSeconds = int.tryParse(_controller.text) ?? 0;
    setState(() => _seconds = totalSeconds);

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() => _seconds--);
      } else {
        timer.cancel();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('⏰ Hết thời gian!')));
      }
    });
  }

  void resetTimer() {
    _timer?.cancel();
    setState(() => _seconds = 0);
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('⏳ Bộ đếm thời gian'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Nhập số giây cần đếm:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ví dụ: 100',
              ),
            ),
            const SizedBox(height: 30),
            Text(
              formatTime(_seconds),
              style: const TextStyle(
                fontSize: 48,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: startTimer,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Bắt đầu'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 205, 189, 232),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: resetTimer,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Đặt lại'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
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
