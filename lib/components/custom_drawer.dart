import 'package:flutter/material.dart';
import '../services/auth/auth_service.dart';
import '../utils/logged_in_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawer();
}

class _CustomDrawer extends State<CustomDrawer> {
  late String _userEmail;
  void getStringValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userEmail = prefs.getString(key) ?? '';
    });
  }

  @override
  void initState() {
    getStringValuesSF('email');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(27, 38, 44, 1),
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(15, 76, 117, 1),
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(15, 76, 117, 1)),
              accountName: const Text(
                '',
                style: TextStyle(fontSize: 18),
              ),
              accountEmail: Text(_userEmail),
              currentAccountPictureSize: const Size.square(50),
              currentAccountPicture: CircleAvatar(
                backgroundColor: const Color.fromRGBO(27, 38, 44, 1),
                child: Text(
                  _userEmail.substring(0, 1).toUpperCase(),
                  style: const TextStyle(fontSize: 30.0, color: Colors.white),
                ), //Text
              ), //circleAvatar
            ), //UserAccountDrawerHeader
          ), //DrawerHeader
          ListTile(
            leading: const Icon(Icons.person),
            textColor: const Color(0xFFE5E5E5),
            iconColor: const Color(0xFFE5E5E5),
            title: const Text(' My Profile '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            textColor: const Color(0xFFE5E5E5),
            iconColor: const Color(0xFFE5E5E5),
            title: const Text(' Change Password '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            textColor: const Color(0xFFE5E5E5),
            iconColor: const Color(0xFFE5E5E5),
            title: const Text('LogOut'),
            onTap: () async {
              int res = await logout('dfdfdff');
              if (res == 201) {
                LoggedInUser.myUser.email = '';
                if (mounted) {
                  Navigator.of(context, rootNavigator: true)
                      .popUntil((route) => route.isFirst);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
