import 'package:flutter/material.dart';
import 'package:newsapp_flutter/articles.dart';
import 'package:newsapp_flutter/detailarticle.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/main_page';
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NewsApp"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('assets/articles.json'),
          builder: (context, snapshot) {
            final List<Articles> articles = parsedArticles(snapshot.data);

            return ListView.builder(
                // ngitung panjang artikel
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return _buildArticleItem(context, articles[index]);
                });
          }),
    );
  }
}

Widget _buildArticleItem(BuildContext context, Articles articles) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    // gambar di sebelah kiri
    leading: SizedBox(
      child: Image.network(
        articles.urlToImage,
        width: 100,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
      ),
    ),
    // teks ama desc di sebelah kanan
    title: Text(articles.title),
    subtitle: Text(articles.description),
    onTap: () {
      Navigator.pushNamed(context, DetailPage.routeName, arguments: articles);
    },
  );
}
