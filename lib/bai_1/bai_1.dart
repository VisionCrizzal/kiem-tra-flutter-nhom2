import 'package:flutter/material.dart';

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [block1(), block2(), block3(), block4()]),
    );
  }

  Widget block1() {
    var src =
        "https://images.unsplash.com/photo-1559586616-361e18714958?q=80&w=1074&auto=format&fit=crop";
    return Image.network(src);
  }

  Widget block2() {
    var title = "Oeschinen Lake Campground";
    var subtitle = "Kandersteg, Switzerland";
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle),
              ],
            ),
          ),
          Row(
            children: const [
              Icon(Icons.star, color: Colors.red),
              SizedBox(width: 4),
              Text("41"),
            ],
          ),
        ],
      ),
    );
  }

  Widget block3() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.call, color: Colors.blue),
              SizedBox(height: 8),
              Text("CALL", style: TextStyle(color: Colors.blue)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.near_me, color: Colors.blue),
              SizedBox(height: 8),
              Text("ROUTE", style: TextStyle(color: Colors.blue)),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.share, color: Colors.blue),
              SizedBox(height: 8),
              Text("SHARE", style: TextStyle(color: Colors.blue)),
            ],
          ),
        ],
      ),
    );
  }

  Widget block4() {
    var data =
        "Lake Oeschinen lies at the foot of the Bluemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.";
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(data, softWrap: true),
    );
  }
}
