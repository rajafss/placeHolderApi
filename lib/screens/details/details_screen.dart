

import 'package:flutter/material.dart';
import 'package:placeholderapi/model/articles/Article_model.dart';
import 'package:placeholderapi/modules/business/Business_screen.dart';

class DetailScreen extends StatelessWidget {
  final Articles todo;

  const DetailScreen({Key? key, required this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text('${todo.title}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('${todo.publishedAt}'),
      ),
    );
  }
}