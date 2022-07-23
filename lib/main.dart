import 'package:flutter/material.dart';
import 'package:news_app/ui/article_detail_page.dart';
import 'package:news_app/common/styles.dart';

import 'data/model/article.dart';
import 'ui/article_web_view.dart';
import 'ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: primaryColor,
          onPrimary: Colors.black,
          secondary: secondaryColor
        ),
        textTheme: myTextTheme,
        appBarTheme: const AppBarTheme(elevation: 0),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: secondaryColor,
            onPrimary: Colors.white,
            textStyle: TextStyle(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              )
            )
          )
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: secondaryColor,
          unselectedItemColor: Colors.grey
        )
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        ArticleDetailPage.routeName: (context) => ArticleDetailPage(
            article: ModalRoute.of(context)?.settings.arguments as Article
        ),
        ArticleWebView.routeName: (context) => ArticleWebView(
          url: ModalRoute.of(context)?.settings.arguments as String,
        )
      },
    );
  }
}