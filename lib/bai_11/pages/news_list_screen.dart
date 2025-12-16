import 'package:flutter/material.dart';
import '../api/api.dart';
import 'news_detail_screen.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tin tức hôm nay")),
      body: FutureBuilder(
        future: newsApi.fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return const Center(child: Text("Không có dữ liệu"));
          }

          final articles = snapshot.data!;

          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, i) {
              final article = articles[i];
              return ListTile(
                leading: article["urlToImage"] != null
                    ? Image.network(
                        article["urlToImage"],
                        width: 80,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.image),
                title: Text(article["title"] ?? "No title"),
                subtitle: Text(article["description"] ?? ""),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NewsDetailPage(article: article),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
