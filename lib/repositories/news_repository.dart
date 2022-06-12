import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsRepository{
  var news = null;

  dynamic searchNews(String key, String date)
  {
    String url = "https://newsapi.org/v2/everything?q=${key}&from=${date}&sortBy=publishedAt&apiKey=2344af3a20884e18a2d000a3414bdce5";
    http.get(Uri.parse(url)).then((reponse){
      news = json.decode(reponse.body);
      print(url);

    }).catchError((onError)=>print(onError));
    return news;
  }
}