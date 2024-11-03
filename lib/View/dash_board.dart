import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    String name = "Selim";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
      ),
      backgroundColor: Colors.blue.shade500,
      body: Padding(
        padding: EdgeInsets.only(top: mediaHeight * 0.04),
        child: Column(
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: mediaWidth * 0.08,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: mediaHeight * 0.002,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: mediaHeight * 0.05),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: mediaWidth / (mediaHeight / 2),
                crossAxisSpacing: mediaWidth * 0.01,
                mainAxisSpacing: mediaHeight * 0.02,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: mediaWidth * 0.02),
                    child: _buildCard(
                      title: "Motivasyon",
                      content: "Başarı,hazırlığın fırsatla buluştuğu yerdir.",
                      color: Colors.green,
                      mediaWidth: mediaWidth,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: mediaWidth * 0.02),
                    child: _buildCard(
                      title: "Geri Sayım",
                      content: "2025 YKS'ye kalan süre:\n231 Gün 3 Saat",
                      color: Colors.red,
                      mediaWidth: mediaWidth,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: mediaWidth * 0.02),
                    child: _buildCard(
                      title: "Görev Takibi",
                      content: "Eksik Görevler \n     5",
                      color: Colors.orange,
                      mediaWidth: mediaWidth,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: mediaWidth * 0.02),
                    child: _buildCard(
                      title: "Film - Kitap Önerisi",
                      content: "'The Pursuit of Happyness' - Mai ve Siyah ",
                      color: Colors.purple,
                      mediaWidth: mediaWidth,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String content,
    required Color color,
    required double mediaWidth,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0, 8),
          ),
        ],
      ),
      padding: EdgeInsets.all(mediaWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: mediaWidth * 0.06,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            content,
            style: TextStyle(
              fontSize: mediaWidth * 0.048,
              color: Colors.white,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
