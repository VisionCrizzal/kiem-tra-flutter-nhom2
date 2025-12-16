import 'package:flutter/material.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  int selectedStar = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Gửi phản hồi",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Họ tên
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Họ tên",
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Đánh giá sao
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey),
              ),
              child: DropdownButton<int>(
                value: selectedStar,
                isExpanded: true,
                underline: const SizedBox(),
                items: List.generate(
                  5,
                  (i) => DropdownMenuItem(
                    value: i + 1,
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange),
                        const SizedBox(width: 8),
                        Text("${i + 1} sao"),
                      ],
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedStar = value!;
                  });
                },
              ),
            ),

            const SizedBox(height: 16),

            // Nội dung góp ý
            TextField(
              controller: contentController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: "Nội dung góp ý",
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Nút gửi
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                final name = nameController.text.trim();
                final content = contentController.text.trim();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Đã gửi phản hồi: $name — $selectedStar sao"),
                  ),
                );
              },
              child: const Text("Gửi phản hồi"),
            ),
          ],
        ),
      ),
    );
  }
}
