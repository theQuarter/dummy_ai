// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:dummy_ai/model/article_model.dart';
import 'package:http/http.dart';

class ApiService {
  final Url =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=69adf82a5dd44ff487d87442978a918b";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(Url));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];
      print("jsonGet");

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      print(res.statusCode);

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
