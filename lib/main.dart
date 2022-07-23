import 'package:flutter/material.dart';
import 'Academy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliverlist Practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LearningPathPage(),
    );
  }
}

class LearningPathPage extends StatelessWidget {
  const LearningPathPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dicoding Learning Paths'),
      ),
      body: const LearningPathList(),
    );
  }
}

class LearningPathList extends StatelessWidget {
  const LearningPathList({Key? key}) : super(key: key);

  SliverPersistentHeader _header(String text) {
    return SliverPersistentHeader(
        pinned: true,
        delegate: SliverAppBarDelegate(
            minHeight: 60,
            maxHeight: 150,
            child: Container(
              color: Colors.lightBlue,
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _header('Android Developer'),
        SliverList(
          delegate: SliverChildListDelegate(
            androidPaths.map(_buildTile).toList(),
          ),
        ),
        _header('iOS Developer'),
        SliverList(
          delegate: SliverChildListDelegate(
            iosPaths.map(_buildTile).toList(),
          ),
        ),
        _header('Multi-Platform App Developer'),
        SliverGrid.count(
          crossAxisCount: 2,
          children: flutterPaths.map(_buildTile).toList(),
        ),
        _header('Front-End Web Developer'),
        SliverGrid.count(
          crossAxisCount: 2,
          children: webPaths.map(_buildTile).toList(),
        )
      ],
    );
  }

  Widget _buildTile(Academy academy) {
    return ListTile(
      title: Text(academy.title),
      subtitle: Text(
        academy.description,
        overflow: TextOverflow.ellipsis,
        maxLines: 4,
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  SliverAppBarDelegate({required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
