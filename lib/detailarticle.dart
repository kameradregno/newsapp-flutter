import 'package:flutter/material.dart';
import 'package:newsapp_flutter/articles.dart';

class DetailPage extends StatelessWidget {
  static const routeName = "/detailpage";
  final Articles article;
  const DetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(article.title),
        ),
        body: Column(
          children: [
            Image.network(article.urlToImage),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.title),
                  const Divider(
                    color: Colors.black,
                  ),
                  Text(article.author),
                  Text(
                    article.publishedAt,
                    style: const TextStyle(color: Colors.black26),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  Text(article.content),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, DetailPage.routeName, arguments: article.url);
                    },
                    icon: const Icon(Icons.open_in_browser),
                    label: const Text("Baca Selengkapnya"),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
