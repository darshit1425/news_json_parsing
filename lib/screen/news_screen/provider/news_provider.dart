import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:news_json_parsing/screen/news_screen/modal/news_modal.dart';


class News_Provider extends ChangeNotifier {
  NewsModel? newsModel;
  Future<void> newsJsonParsing() async {
    var jsonString = await rootBundle.loadString("assets/news/news.json");
    var json = jsonDecode(jsonString);
    newsModel=NewsModel().newsFromJson(json);
    notifyListeners();
  }
}
