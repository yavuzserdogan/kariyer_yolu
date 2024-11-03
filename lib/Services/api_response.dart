import 'package:test_egitim/Services/gemini_services.dart';

class ApiResponseHandler {
  final GeminiService geminiService = GeminiService();
  List<String> extractedWords = [];

  Future<String> fetchRecommendedFields(String prompt) async {
    try {
      final response = await geminiService.generateContent(prompt);
      String formattedResponse = response;
      RegExp exp = RegExp(r"\*\*(.*?)\*\*");
      extractedWords = exp.allMatches(formattedResponse)
          .map((match) => match.group(1) ?? "")
          .toList();
      return formattedResponse;
    } catch (e) {
      throw Exception("İstek sırasında hata oluştu: $e");
    }
  }
}
