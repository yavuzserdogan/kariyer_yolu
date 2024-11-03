import 'package:flutter/material.dart';
import 'package:test_egitim/Services/api_response.dart';
import 'package:test_egitim/Data/questions.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final ApiResponseHandler apiResponseHandler = ApiResponseHandler();
  final List<String> answers = List.filled(
      questionsPersonal.length + questionsLesson.length, "");

  void _selectAnswer(int questionIndex, String answer) {
    answers[questionIndex] = answer;
  }

  Future<void> _submitAnswers() async {
    try {
      String prompt = "Kullanıcının verdiği yanıtlara göre analiz yapın. Aşağıda her soru ve kullanıcının verdiği yanıt sıralanmıştır.\n\n";
      for (int i = 0; i < questionsPersonal.length; i++) {
        prompt += "Soru: ${questionsPersonal[i]['question']}\n";
        prompt += "Yanıt: ${answers[i]}\n\n";
      }
      for (int i = 0; i < questionsLesson.length; i++) {
        prompt += "Soru: ${questionsLesson[i]['question']}\n";
        prompt += "Yanıt: ${answers[questionsPersonal.length + i]}\n\n";
      }

      prompt += "Bu verilere dayanarak kullanıcının ilgi alanlarına göre sadece 3 meslek öner ve en başarılı olduğu 3 ders alanını belirt yalnız isimlerini yazdır.Meslek gruplarını açıklaamda bulunma";

      String result = await apiResponseHandler.fetchRecommendedFields(prompt);

      result = result.replaceAll("**", "");
      result = result.split("\n").where((line) => line.trim().isNotEmpty).join("\n");

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Önerilen Meslekler ve İlgili Dersler'),
          content: Text(result),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Kapat'),
            ),
          ],
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Hata'),
          content: Text('Bir hata oluştu: $e'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Tamam'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade500,
      ),
      backgroundColor: Colors.blue.shade500,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Kişisel Test",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 20),
              for (int i = 0; i < questionsPersonal.length; i++) ...[
                Text(
                  questionsPersonal[i]['question'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                ...List<Widget>.generate(
                  questionsPersonal[i]['options'].length,
                      (optionIndex) => RadioListTile<String>(
                    title: Text(questionsPersonal[i]['options'][optionIndex],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                    value: questionsPersonal[i]['options'][optionIndex],
                    groupValue: answers[i],
                    onChanged: (value) {
                      setState(() {
                        _selectAnswer(i, value!);
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
              ],
              const Text(
                "Dersler",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 20),
              for (int i = 0; i < questionsLesson.length; i++) ...[
                Text(
                  questionsLesson[i]['question'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                ...List<Widget>.generate(
                  questionsLesson[i]['options'].length,
                      (optionIndex) => RadioListTile<String>(
                    title: Text(questionsLesson[i]['options'][optionIndex],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                    value: questionsLesson[i]['options'][optionIndex],
                    groupValue: answers[questionsPersonal.length + i],
                    onChanged: (value) {
                      setState(() {
                        _selectAnswer(questionsPersonal.length + i, value!);
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
              ],
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: answers.contains("") ? null : _submitAnswers,
                child: Text('Gönder'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
