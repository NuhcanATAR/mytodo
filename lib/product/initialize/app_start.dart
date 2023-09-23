import 'package:flutter/material.dart';

// pub dev
import 'package:intl/date_symbol_data_local.dart';

// pub dev
import 'package:firebase_core/firebase_core.dart';
import 'package:mytodo/firebase_options.dart';

@immutable
class AppStart {
  const AppStart._();

  static Future<void> initStart() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    initializeDateFormatting('tr_TR', null); // Türkçe dil ayarlarını başlatın
  }
}
