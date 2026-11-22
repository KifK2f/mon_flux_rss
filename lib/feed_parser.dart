import 'dart:convert';

import 'package:webfeed/domain/rss_feed.dart';

import 'article.dart';
import 'package:http/http.dart' as http;

class FeedParser {

  static var shared = FeedParser();
  final String source = "https://www.ici.fr/rss/infos.xml"; //Source pour l'URL

  Future<List<Article>?> parseArticle() async {
    final client = http.Client(); // on va créer avec notre RSS un client
    final url = Uri.parse(source); //Convertir la String en Url
    final clientResponse = await client.get(url); //Attendre que le client obtienne une répnse de cette Url
    // final rssFeed = RssFeed.parse(clientResponse.body); //Cnvertir tout ve dont on a besoin
    final rssFeed = RssFeed.parse(utf8.decode(clientResponse.bodyBytes)); //Cnvertir tout ve dont on a besoin. ici on decode car ce n'est pas encore formaté
    final items = rssFeed.items;
    if (items == null){
      return null;
    } else {
      List<Article> articles = items.map((item) => Article(item: item)).toList();
      return articles;
    }
  }

}