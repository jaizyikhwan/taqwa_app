import 'dart:convert';

import 'package:taqwa_app/models/surah.dart';
import 'package:http/http.dart' as http;

class QuranService {
  static const String apiUrl = "https://equran.id/api/v2/surat";

  static Future<List<Surah>> fetchSurah() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      final body = response.body;
      final result = jsonDecode(body);
      List<Surah> surah = List<Surah>.from(
        result['data'].map(
          (surah) => Surah.fromJson(surah),
        ),
      );
      return surah;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
