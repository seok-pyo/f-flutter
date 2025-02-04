import 'dart:convert';

import 'package:flutter_application_2/service/detail_model.dart';
import 'package:flutter_application_2/service/episode_model.dart';
import 'package:flutter_application_2/service/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static String today = "today";

  static Future<List<WebtoonModel>> getTodayToons() async {
    List<WebtoonModel> webtoonList = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonList.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonList;
    }
    throw Error();
  }

  static Future<DetailModel> getDetail(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> details = jsonDecode(response.body);
      return DetailModel.fromJson(details);
    }
    throw Error();
  }

  static Future<List<EpisodeModel>> getEpisode(String id) async {
    List<EpisodeModel> episodeList = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodeList.add(EpisodeModel.fromJson(episode));
      }
      return episodeList;
    }
    throw Error();
  }
}
