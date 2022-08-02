import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_service.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/widgets/card_article.dart';
import 'package:news_app/widgets/platform_widget.dart';
import 'package:provider/provider.dart';

import '../data/model/article.dart';
import 'article_detail_page.dart';

class ArticleListPage extends StatelessWidget {
  const ArticleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('News App'),
        transitionBetweenRoutes: false,
      ),
      child: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return SingleChildScrollView(child: Consumer<NewsProvider>(
      builder: (context, state, child) {
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result.articles.length,
            itemBuilder: (context, index) {
              var article = state.result.articles[index];
              return CardArticle(
                article: article,
              );
            },
          );
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text(''));
        }
      },
    ));
  }
}

// Column(
//         children: [
//           ElevatedButton(
//             child: Text("Refresh Data"),
//             onPressed: () {
//               setState(() {
//                 _article = ApiService().topHeadlines();
//               });
//             },
//           ),
//           FutureBuilder(
//             future: _article,
//             builder: (context, AsyncSnapshot<ArticlesResult> snapshot) {
//               var state = snapshot.connectionState;
//               if (state != ConnectionState.done) {
//                 return Center(child: CircularProgressIndicator());
//               } else {
//                 if (snapshot.hasData) {
//                   return ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: snapshot.data?.articles.length,
//                     itemBuilder: (context, index) {
//                       var article = snapshot.data?.articles[index];
//                       return CardArticle(article: article!);
//                     },
//                   );
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text(snapshot.error.toString()));
//                 } else {
//                   return Text('');
//                 }
//               }
//             },
//           ),
//         ],
//       ),
//     );
