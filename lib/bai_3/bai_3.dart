import 'package:flutter/material.dart';

class Classroom extends StatelessWidget {
  const Classroom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  Widget myBody() {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 10),
      children: [
        item(
          title: "XML và ứng dụng - Nhóm 1",
          courseCode: "2025-2026.1.TIN4583.001",
          studentCount: 58,
          color: Color(0xFF3a4c64),
        ),
        item(
          title: "Lập trình ứng dụng cho các thiết bị di động - Nhóm 6",
          courseCode: "2025-2026.1.TIN4403.006",
          studentCount: 55,
          color: Color(0xFFd34836),
        ),
        item(
          title: "Lập trình ứng dụng cho các thiết bị di động - Nhóm 5",
          courseCode: "2025-2026.1.TIN4403.005",
          studentCount: 52,
          color: Color(0xFFd34836),
        ),
        item(
          title: "Lập trình ứng dụng cho các thiết bị di động - Nhóm 4",
          courseCode: "2025-2026.1.TIN4403.004",
          studentCount: 50,
          color: Color(0xFF2980b9),
        ),
        item(
          title: "Lập trình ứng dụng cho các thiết bị di động - Nhóm 3",
          courseCode: "2025-2026.1.TIN4403.003",
          studentCount: 52,
          color: Color(0xFF3a4c64),
        ),
      ],
    );
  }

  Widget item({
    required String title,
    required String courseCode,
    required int studentCount,
    required Color color,
  }) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      courseCode,
                      style: TextStyle(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Text(
                  "$studentCount học viên",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              debugPrint("Bạn đã bấm vào $title");
            },
            icon: Icon(Icons.more_horiz, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
