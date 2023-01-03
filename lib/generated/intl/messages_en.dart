// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(vehicleType) => "${Intl.select(vehicleType, {
            'sedan': 'Sedan',
            'cabriolet': 'Solid roof cabriolet',
            'truck': '16 wheel truck',
            'other': 'Other',
          })}";

  static String m1(sex) =>
      "${Intl.gender(sex, female: 'Her birthday', male: 'His birthday', other: 'Their birthday')}";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'You have no new messages', one: 'You have 1 new message', other: 'You have ${count} new messages')}";

  static String m3(firstName) => "Welcome ${firstName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("Demo app"),
        "commonVehicleType": m0,
        "pageHomeBirthday": m1,
        "pageHomeInboxCount": m2,
        "pageHomeTitle": m3,
        "pageLoginPassword":
            MessageLookupByLibrary.simpleMessage("Your password"),
        "pageLoginUsername":
            MessageLookupByLibrary.simpleMessage("Your username")
      };
}
