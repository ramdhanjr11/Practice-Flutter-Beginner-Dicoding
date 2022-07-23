import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(primaryColor: CupertinoColors.systemOrange),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.news), label: 'Feeds'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings), label: 'Settings')
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return FeedsPage();
            case 1:
              return SearchPage();
            case 2:
              return SettingsPage();
            default:
              return Center(
                child: Text('Page not found!'),
              );
          }
        });
  }
}

class FeedsPage extends StatelessWidget {
  const FeedsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Feeds Page'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Feeds Page',
              style:
                  CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
            SizedBox(
              height: 8,
            ),
            CupertinoButton.filled(
              child: Text('Select Category'),
              onPressed: () {
                showCupertinoModalPopup(context: context, builder: (context) {
                  return CupertinoActionSheet(
                    title: Text('Select Categories'),
                    actions: [
                      CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(builder: (context) => CategoryPage(
                                selectedCategory: 'Technology'
                              ))
                            );
                          },
                          child: Text('Technology')
                      ),
                      CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(builder: (context) => CategoryPage(
                                    selectedCategory: 'Business'
                                ))
                            );
                          },
                          child: Text('Business')
                      ),
                      CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(builder: (context) => CategoryPage(
                                    selectedCategory: 'Sport'
                                ))
                            );
                          },
                          child: Text('Sport')
                      )
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      child: Text('Close'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  );
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Search Page'),
      ),
      child: Center(
        child: Text(
          'Search Page',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Settings Page'),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text('Log out'),
          onPressed: () {
            showCupertinoDialog(context: context, builder: (context) {
              return CupertinoAlertDialog(
                title: Text('Are you sure to log out?'),
                actions: [
                  CupertinoDialogAction(
                      child: Text('No'),
                    onPressed: () => Navigator.pop(context),
                  ),
                  CupertinoDialogAction(
                    child: Text('Yes'),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              );
            });
          },
        )
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final String selectedCategory;
  const CategoryPage({Key? key, required this.selectedCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('$selectedCategory Page'),
      ),
      child: Center(
        child: Text(
          '$selectedCategory Page',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
    );
  }
}
