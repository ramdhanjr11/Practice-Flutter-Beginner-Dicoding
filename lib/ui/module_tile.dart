import 'package:flutter/material.dart';

class ModuleTile extends StatelessWidget {
  final String moduleName;
  final bool isDone;
  final Function() onClick;

  const ModuleTile(
      {Key? key,
        required this.moduleName,
        required this.isDone,
        required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(moduleName),
      trailing: isDone
          ? const Icon(Icons.done)
          : ElevatedButton(
        onPressed: onClick,
        child: const Text('Done'),
      ),
    );
  }
}