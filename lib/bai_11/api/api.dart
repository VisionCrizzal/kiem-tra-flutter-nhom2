import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsApi {
  final String apiKey = "31fe2517fb1d4235b86a419b25227438";

  Future<List<dynamic>> fetchNews() async {
    final url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData["articles"];
    } else {
      throw Exception("Không tải được API: ${response.body}");
    }
  }
}

final newsApi = NewsApi();
