import 'dart:convert';

import 'package:flutter_application_2/service/webToonModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  Future<List<WebToonModel>> getTodayToons() async {
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
}
