import 'dart:convert';
import 'package:newsproject/model/newsmodel.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

class NewsHelper {
  List<NewsModel> news = [];

  Future<void> getNews() async {
    String url = "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=79b8d0ff55fb4dbbae015048a54e63a4";
    var response = await http.get(url);
    var jsondata = jsonDecode(response.body);
    if (jsondata['status'] == 'ok') {
      jsondata['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          NewsModel newsModel = NewsModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
             // publishedAt: element['publishedAt'],
              content: element['content']);
          news.add(newsModel);
        }
      });
    }
  }
}
class CategoryHelper {
  List<NewsModel> news = [];

  Future<void> getNews(String Category) async {
    String url = "http://newsapi.org/v2/top-headlines?country=in&category=$Category&apiKey=79b8d0ff55fb4dbbae015048a54e63a4";
    var response = await http.get(url);
    var jsondata = jsonDecode(response.body);
    if (jsondata['status'] == 'ok') {
      jsondata['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          NewsModel newsModel = NewsModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              // publishedAt: element['publishedAt'],
              content: element['context']);
          news.add(newsModel);
        }
      });
    }
  }
}
