import 'package:dio/dio.dart';
import 'package:flutter_application_13/bai_10/model/product.dart';

class API {
  Future<List<Product>> getAllProduct() async {
    var url = 'https://fakestoreapi.com/products';
    var dio = Dio();
    var responsive = await dio.request(url);

    if (responsive.statusCode == 200) {
      List data = responsive.data;

      // y chang code của mày nhưng viết đúng cú pháp
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      print('Loi roi bro');
      return [];
    }
  }
}

var test_API = API();
