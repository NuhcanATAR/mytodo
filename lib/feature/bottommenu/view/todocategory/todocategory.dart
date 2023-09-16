import 'package:flutter/material.dart';

class TodoCategoryView extends StatefulWidget {
  const TodoCategoryView({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<TodoCategoryView> createState() => _TodoCategoryViewState();
}

class _TodoCategoryViewState extends State<TodoCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data['TODO'].toString()),
      ),
    );
  }
}
