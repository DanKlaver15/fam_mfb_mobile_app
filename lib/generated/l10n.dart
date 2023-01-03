// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Demo app`
  String get appName {
    return Intl.message(
      'Demo app',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Your username`
  String get pageLoginUsername {
    return Intl.message(
      'Your username',
      name: 'pageLoginUsername',
      desc: '',
      args: [],
    );
  }

  /// `Your password`
  String get pageLoginPassword {
    return Intl.message(
      'Your password',
      name: 'pageLoginPassword',
      desc: '',
      args: [],
    );
  }

  /// `Welcome {firstName}`
  String pageHomeTitle(Object firstName) {
    return Intl.message(
      'Welcome $firstName',
      name: 'pageHomeTitle',
      desc: 'Welcome message on the Home screen',
      args: [firstName],
    );
  }

  /// `{count, plural, zero{You have no new messages} one{You have 1 new message} other{You have {count} new messages}}`
  String pageHomeInboxCount(num count) {
    return Intl.plural(
      count,
      zero: 'You have no new messages',
      one: 'You have 1 new message',
      other: 'You have $count new messages',
      name: 'pageHomeInboxCount',
      desc: 'New messages count on the Home screen',
      args: [count],
    );
  }

  /// `{sex, select, male{His birthday} female{Her birthday} other{Their birthday}}`
  String pageHomeBirthday(String sex) {
    return Intl.gender(
      sex,
      male: 'His birthday',
      female: 'Her birthday',
      other: 'Their birthday',
      name: 'pageHomeBirthday',
      desc: 'Birthday message on the Home screen',
      args: [sex],
    );
  }

  /// `{vehicleType, select, sedan{Sedan} cabriolet{Solid roof cabriolet} truck{16 wheel truck} other{Other}}`
  String commonVehicleType(Object vehicleType) {
    return Intl.select(
      vehicleType,
      {
        'sedan': 'Sedan',
        'cabriolet': 'Solid roof cabriolet',
        'truck': '16 wheel truck',
        'other': 'Other',
      },
      name: 'commonVehicleType',
      desc: 'Vehicle type',
      args: [vehicleType],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
