import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/webtoon_detail.dart';
import '../models/webtoon_episode.dart';
import '../models/webtoon_model.dart';

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

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return WebtoonDetailModel.fromJson(jsonDecode(response.body));
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodeById(
      String id) async {
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    List<WebtoonEpisodeModel> episodeModels = [];

    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodeModels.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodeModels;
    }
    throw Error();
  }
}