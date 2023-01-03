import 'package:hive_flutter/hive_flutter.dart';

import '../../models/user.dart';

class HiveController {

  void writeUserToHive(User user) async {
    final box = await Hive.openBox('myFullBreath');
    box.put("user", user);
  }

  Future<User?> readUserFromHive() async {
    final box = await Hive.openBox('myFullBreath');
    return box.get("user");
  }
}