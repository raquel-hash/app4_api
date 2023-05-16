import 'package:app4_api/data/models/news_model.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

String _language = 'language=en';
String _apiKey = 'apikey=pub_21896ddaac605647c21db28f859be1c748da2';
String _country = 'country=ca';

String url = 'https://newsdata.io/api/1/news?$_apiKey&$_language&$_country';

class NewsProvider extends ChangeNotifier {
  List<Result> newsList = [];

  NewsProvider() {
    print("LLAMANDO A LAS NOTICIAS");
    getNews();
  }

  final dio = Dio();

  // getNews() async {
  //   final response = await http.get(Uri.parse(url));

  //   final resp = newsModelFromJson(response.body);

  //   newsList.addAll(resp.results);
  //   notifyListeners();
  // }

  getNews() async {
    final response = await dio.get(url);
    final respResult = NewsModel.fromJson(response.data);
    newsList.addAll(respResult.results);
    notifyListeners();
  }
}
