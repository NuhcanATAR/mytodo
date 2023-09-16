import 'package:flutter/material.dart';

class ImportantView extends StatefulWidget {
  const ImportantView({super.key});

  @override
  State<ImportantView> createState() => _ImportantViewState();
}

class _ImportantViewState extends State<ImportantView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Önemli"),
      ),
    );
  }
}
