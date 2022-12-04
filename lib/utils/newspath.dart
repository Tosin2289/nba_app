import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPath extends StatefulWidget {
  final title;
  final source;
  final url;
  NewsPath({
    Key? key,
    required this.source,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  State<NewsPath> createState() => _NewsPathState();
}

class _NewsPathState extends State<NewsPath> {
  Future lunchurl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else
      throw 'cant launch link';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (() {
                launchUrl(Uri.parse(widget.url));
              }),
              child: Text(
                "Read more",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
