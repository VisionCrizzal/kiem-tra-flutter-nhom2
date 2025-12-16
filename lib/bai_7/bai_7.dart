import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BMIScreen(),
    );
  }
}

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  double? bmi;
  String result = "";

  void calculateBMI() {
    final double height = double.tryParse(heightController.text) ?? 0;
    final double weight = double.tryParse(weightController.text) ?? 0;

    if (height <= 0 || weight <= 0) return;

    final double bmiValue = weight / (height * height);

    String classification;
    if (bmiValue < 18.5) {
      classification = "Thiếu cân";
    } else if (bmiValue < 25) {
      classification = "Bình thường";
    } else if (bmiValue < 30) {
      classification = "Thừa cân";
    } else {
      classification = "Béo phì";
    }

    setState(() {
      bmi = bmiValue;
      result = classification;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Tính chỉ số BMI"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Chiều cao (m)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Cân nặng (kg)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: calculateBMI,
              icon: const Icon(Icons.calculate),
              label: const Text("Tính BMI"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            if (bmi != null) ...[
              Text(
                "Chỉ số BMI: ${bmi!.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Phân loại: $result",
                style: const TextStyle(fontSize: 18, color: Colors.red),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
