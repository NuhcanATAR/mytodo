import 'package:flutter/material.dart';

// router view
import 'package:mytodo/product/utility/error/splash_appclose.dart';
import 'package:mytodo/product/utility/error/splash_error.dart';
import 'feature/splash/splash.dart';

// pub dev
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// model & database
import 'package:mytodo/product/initialize/app_start.dart';
import 'package:mytodo/product/utility/firebase/database/splash_db/splash.dart';

Future<void> main() async {
  await AppStart.initStart();
  runApp(
    const MainView(),
  );
}

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<DocumentSnapshot>(
        future: SpashServiceDb.APPSTART.refCol,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SplashErrorView();
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return data['STATUS'] == true
                ? const SplashView()
                : const SplashAppCloseView();
          }

          return const Scaffold();
        },
      ),
    );
  }
}
