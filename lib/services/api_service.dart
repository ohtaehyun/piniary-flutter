import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:piniary/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodayToons() async {
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    List<WebtoonModel> webtoonModels = [];

    if (response.statusCode == 200) {
      List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonModels.add(WebtoonModel.fromJson(webtoon));
      }

      return webtoonModels;
    }
    throw Error();
  }
}
