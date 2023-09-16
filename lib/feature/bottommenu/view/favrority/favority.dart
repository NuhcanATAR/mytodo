import 'package:flutter/material.dart';

class FavorityView extends StatefulWidget {
  const FavorityView({super.key});

  @override
  State<FavorityView> createState() => _FavorityViewState();
}

class _FavorityViewState extends State<FavorityView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoriler"),
      ),
    );
  }
}
