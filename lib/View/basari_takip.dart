import 'package:flutter/material.dart';

class BasariTakip extends StatefulWidget {
  @override
  _BasariTakipState createState() => _BasariTakipState();
}

class _BasariTakipState extends State<BasariTakip> {
  List<bool> isChecked = List.generate(10, (index) => false);
  List<bool> isExpanded = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Başarı Takip"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade500,
      ),
      backgroundColor: Colors.blue.shade500,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Görev Listesi",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ExpansionTile(
                      onExpansionChanged: (expanded) {
                        setState(() {
                          isExpanded[index] = expanded;
                        });
                      },
                      initiallyExpanded: isExpanded[index],
                      title: Row(
                        children: [
                          Checkbox(
                            value: isChecked[index],
                            onChanged: (value) {
                              setState(() {
                                isChecked[index] = value!;
                              });
                            },
                            activeColor: Colors.blue,
                            checkColor: Colors.white,
                          ),
                          Expanded(
                            child: Text(
                              'Görev ${index + 1}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: isChecked[index] ? Colors.grey : Colors.black,
                                decoration: isChecked[index]
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                          ),
                          Icon(
                            isChecked[index] ? Icons.check_circle : Icons.circle_outlined,
                            color: isChecked[index] ? Colors.green : Colors.grey,
                            size: 28,
                          ),
                        ],
                      ),
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alt Görev 1",
                                  style: TextStyle(fontSize: 18, color: Colors.black54)),
                              SizedBox(height: 4),
                              Text("Alt Görev 2",
                                  style: TextStyle(fontSize: 18, color: Colors.black54)),
                              SizedBox(height: 4),
                              Text("Alt Görev 3",
                                  style: TextStyle(fontSize: 18, color: Colors.black54)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
