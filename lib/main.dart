import 'dart:io';
import 'dart:ui';

import 'package:f_logs/f_logs.dart' as log;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flurry_sdk/flurry.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'package:app/generated/l10n.dart';
import 'package:app/pages/login_page.dart';

void main() async {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };

  Locale deviceLocale = window.locale;
  String langCode = deviceLocale.languageCode;

  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: MyApp(langCode: langCode)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.langCode});

  final String langCode;

  void init() {
    Flurry.builder.withCrashReporting(true).withLogEnabled(true).withLogLevel(LogLevel.debug).withMessaging(true).withPerformanceMetrics(Performance.all).build(
          androidAPIKey: 'X5CNN9JPQ8B7FNCNV5VQ',
          iosAPIKey: 'XYJY7J9MPJ43ZTDDQ526',
        );

    log.LogsConfig config = log.FLog.getDefaultConfigurations()
      ..isDevelopmentDebuggingEnabled = true
      ..timestampFormat = log.TimestampFormat.TIME_FORMAT_FULL_2;

    log.FLog.applyConfigurations(config);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //debugShowMaterialGrid: true,
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
        fontFamily: 'Montserrat',
      ),
      home: const LoginPage(),
      builder: (context, widget) {
        Widget error = const Text('...rendering error...');
        if (widget is Scaffold || widget is Navigator) {
          error = Scaffold(body: Center(child: error));
        }
        ErrorWidget.builder = (errorDetails) => error;
        if (widget != null) return widget;
        throw ('widget is null');
      },
    );
  }
}
