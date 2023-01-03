import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_flurry_sdk/flurry.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './components/pages/home_page.dart';
import './generated/l10n.dart';

void main() async {
  await Hive.initFlutter();
  Locale deviceLocale = window.locale;
  String langCode = deviceLocale.languageCode;

  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false, home: MyApp(langCode: langCode)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.langCode});

  final String langCode;

  void init() {
    Flurry.builder
        .withCrashReporting(true)
        .withLogEnabled(true)
        .withLogLevel(LogLevel.debug)
        .withMessaging(true)
        .withPerformanceMetrics(Performance.all)
        .build(
          androidAPIKey: 'X5CNN9JPQ8B7FNCNV5VQ',
          iosAPIKey: 'XYJY7J9MPJ43ZTDDQ526',
        );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'MyFullBreath',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        focusColor: const Color(0xFFE5E5E5),
      ),
      home: HomePageWidget(),
    );
  }
}
