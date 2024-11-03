import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiService {
  static final GeminiService _instance = GeminiService._internal();
  late GenerativeModel model;
  factory GeminiService() {
    return _instance;
  }

  GeminiService._internal() {
    final String apiKey = dotenv.env['API_KEY']!;
    model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
    );
  }
  Future<String> generateContent(String prompt) async {
    try {
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      return response.text ?? 'Boş yanıt döndü';
    } catch (e) {
      throw Exception("İstek sırasında hata oluştu: $e");
    }
  }
}
