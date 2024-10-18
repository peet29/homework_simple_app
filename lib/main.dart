import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:homework_simple_app/src/main_widget.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('th', 'TH')],
      path: 'assets/translations',
      fallbackLocale: const Locale('th', 'TH'),
      child: const ProviderScope(
        child: MainWidget(),
      ),
    ),
  );
}
