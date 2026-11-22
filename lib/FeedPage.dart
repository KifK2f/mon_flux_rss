import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mon_flux_rss/article.dart';
import 'package:mon_flux_rss/article_tile.dart';
import 'package:mon_flux_rss/feed_parser.dart';

class Feedpage extends StatefulWidget {
  const Feedpage({super.key});


  @override
  State<StatefulWidget> createState() {
    return FeedPageState();
  }

}

class FeedPageState extends State<Feedpage> {

  final parser = FeedParser.shared;
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    parser.parseArticle().then((articles) {
      if (articles != null){
        setState(() {
          this.articles = articles;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon flux RSS"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.separated(
          // itemBuilder: ((context, index) => ListTile(title: Text(articles[index].title),)),
          itemBuilder: ((context, index) => ArticleTile(article: articles[index],)),
          separatorBuilder: ((context, index) => Divider(color: Theme.of(context).colorScheme.inversePrimary)),
          itemCount: articles.length
      )
    );
  }

}