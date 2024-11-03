import 'package:flutter/material.dart';
import 'package:test_egitim/Data/meslekler.dart';

class MeslekDetaylar extends StatelessWidget {
  final String meslek;
  const MeslekDetaylar({Key? key, required this.meslek}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var jobInfo = jobs[meslek];
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    final List<Map<String, String>> infoList = [
      {"title": "Tanım", "content": jobInfo?["tanım"] ?? ""},
      {"title": "Yetenekler", "content": jobInfo?["yetenekler"].join(", ") ?? ""},
      {"title": "Maaş", "content": jobInfo?["maaş"] ?? ""},
      {"title": "Potansiyel Meslekler", "content": jobInfo?["potansiyelMeslekler"].join(", ") ?? ""},
    ];


    return Scaffold(
      appBar: AppBar(
        title: Text(
          meslek,
          style: TextStyle(
            fontSize: mediaWidth * 0.07,
            fontWeight: FontWeight.bold,
            color: Colors.greenAccent,
          ),
        ),
        backgroundColor: Colors.blue.shade500,
      ),
      backgroundColor: Colors.blue.shade500,
      body: Padding(
        padding: EdgeInsets.all(mediaWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var bilgi in infoList) ...[
              Text(
                bilgi["title"]!,
                style: TextStyle(
                  fontSize: mediaWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent
                ),
              ),
              Text(
                bilgi["content"]!,
                style: TextStyle(
                  fontSize: mediaWidth * 0.05,
                  color: Colors.white
              ),
              ),
              SizedBox(height: mediaHeight * 0.02),
            ],
          ],
        ),
      ),
    );
  }
}
