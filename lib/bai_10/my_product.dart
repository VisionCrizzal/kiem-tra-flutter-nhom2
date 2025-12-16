import 'package:flutter/material.dart';
import 'package:flutter_application_13/bai_10/model/product.dart';
import 'package:flutter_application_13/bai_10/api.dart';

class Myproduct extends StatefulWidget {
  const Myproduct({super.key});

  @override
  State<Myproduct> createState() => _MyproductState();
}

class _MyproductState extends State<Myproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        title: const Text("Sản phẩm nổi bật"),
        backgroundColor: Colors.deepOrange,
      ),
      body: FutureBuilder<List<Product>>(
        future: test_API.getAllProduct(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snap.hasData || snap.data!.isEmpty) {
            return const Center(child: Text("Không có sản phẩm"));
          }

          var ls = snap.data!;
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: ls.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 cột kiểu Shopee/Tiki
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.65, // tỉ lệ card
            ),
            itemBuilder: (context, i) => productCard(ls[i]),
          );
        },
      ),
    );
  }

  Widget productCard(Product p) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // hình sản phẩm
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.network(
                p.image ?? "",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),

          // phần dưới của card
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  p.title ?? "No Title",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),

                // giá
                Text(
                  "\$${p.price}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                // rating
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(
                      p.rating?.rate?.toString() ?? "0",
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "(${p.rating?.count ?? 0})",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
