import 'dart:convert';

import 'package:flutter_application_2/service/detail_model.dart';
import 'package:flutter_application_2/service/episode_model.dart';
import 'package:flutter_application_2/service/webToon_Model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static String today = "today";

  static Future<List<WebToonModel>> getTodayToons() async {
    List<WebToonModel> webtoonList = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonList.add(WebToonModel.fromJson(webtoon));
      }
      return webtoonList;
    }
    throw Error();
  }

  static Future<DetailModel> getDetail(String id) async {
    // List<DetailModel> detailList = [];
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> details = jsonDecode(response.body);
      // for (var detail in details) {
      //   detailList.add(DetailModel.fromJson(detail));
      // }

      return DetailModel.fromJson(details);
    }
    throw Error();
  }

  static Future<List<EpisodeModel>> getEpisode(String id) async {
    List<EpisodeModel> epiList = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> episodes = jsonDecode(response.body);
      for (var epi in episodes) {
        epiList.add(EpisodeModel.fromJson(epi));
      }
      return epiList;
    }
    return throw Error();
  }
}
