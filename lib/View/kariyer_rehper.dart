import 'package:flutter/material.dart';
import 'package:test_egitim/Data/meslekler.dart';
import 'package:test_egitim/View/meslek_detaylar.dart';

class KariyerRehper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title:  Text("Kariyer Rehberi",
          style: TextStyle(
          fontSize: mediaWidth * 0.06,
          fontWeight: FontWeight.w700,
        ),),
        centerTitle: true,
        backgroundColor: Colors.blue.shade500,
      ),
      backgroundColor: Colors.blue.shade500,
      body: ListView.builder(
        itemCount: jobs.keys.length,
        itemBuilder: (context, index) {
          String jobName = jobs.keys.elementAt(index);
          return Container(
            margin: EdgeInsets.symmetric(vertical: mediaHeight * 0.011, horizontal: mediaWidth * 0.04),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                jobName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: mediaWidth * 0.052,
                  fontWeight: FontWeight.w500
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MeslekDetaylar(meslek: jobName),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
