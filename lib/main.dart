import 'package:flutter/material.dart';
import 'package:newsapp_flutter/articles.dart';
import 'package:newsapp_flutter/detailarticle.dart';
import 'package:newsapp_flutter/mainpage.dart';
import 'package:newsapp_flutter/webviewpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: MainPage.routeName,
      routes: {
        MainPage.routeName: (context) => const MainPage(),
        DetailPage.routeName: (context) => DetailPage(
            article: ModalRoute.of(context)?.settings.arguments as Articles),
        WebViewPage.routeName: (context) => WebViewPage(
            url: ModalRoute.of(context)?.settings.arguments as String),
      },
    );
  }
}
