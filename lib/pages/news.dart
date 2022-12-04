import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:nba_app/utils/news_card.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);
  Future getNews() async {
    var url = 'https://nba-latest-news.p.rapidapi.com/news';
    Map<String, String> headers = {
      'X-RapidAPI-Key': 'b69cb11239mshab2a2abc94c6a70p16a0dbjsna6609ede3bdb',
      'X-RapidAPI-Host': 'nba-latest-news.p.rapidapi.com'
    };
    var response = await http.get(Uri.parse(url), headers: headers);
    var jsonData = jsonDecode(response.body);
    List<news> LatestNews = [];
    for (var eachnews in jsonData) {
      news News = news(
          title: eachnews['title'],
          url: eachnews['url'],
          source: eachnews['source']);
      LatestNews.add(News);
    }
    return LatestNews;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("News Feed".toUpperCase()),
        ),
        body: RefreshIndicator(
          onRefresh: getNews,
          child: FutureBuilder(
              future: getNews(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                        child: Lottie.asset('assets/basketloading.json')),
                  );
                } else
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: ((context, index) {
                        return NewsCard(
                            url: snapshot.data[index].url,
                            source: snapshot.data[index].source,
                            title: snapshot.data[index].title);
                      }));
              }),
        ));
  }
}

class news {
  final title;
  final url;
  final source;
  news({required this.title, required this.url, required this.source});
}
