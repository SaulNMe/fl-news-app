import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _urlApi = 'https://newsapi.org/v2';
final _apikey = '551c584e47b84637a5c04cd6e63f2ea1';

class NewsService with ChangeNotifier {
  List<Article> headelines = [];

  NewsService() {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = '$_urlApi/top-headlines?apiKey=$_apikey&country=us';
    final response = await http.get(url);
    final newsResponse = newsModelsFromJson(response.body);
    this.headelines.addAll(newsResponse.articles);
    notifyListeners();
  }

}

