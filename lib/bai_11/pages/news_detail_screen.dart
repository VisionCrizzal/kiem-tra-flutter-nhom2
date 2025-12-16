import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailPage extends StatelessWidget {
  final Map article;

  const NewsDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article["title"] ?? "Chi tiết")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article["urlToImage"] != null)
              Image.network(article["urlToImage"]),

            const SizedBox(height: 10),

            Text(
              article["title"] ?? "",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(article["content"] ?? ""),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final url = Uri.parse(article["url"]);
                launchUrl(url, mode: LaunchMode.externalApplication);
              },
              child: const Text("Đọc bài gốc"),
            ),
          ],
        ),
      ),
    );
  }
}
