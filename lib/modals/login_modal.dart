import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/generated/assets.dart';
import 'package:get/get.dart';

import '../pages/dashboard_page.dart';

class LoginModal extends StatefulWidget {
  const LoginModal({Key? key}) : super(key: key);

  _LoginModal createState() => _LoginModal();
}

class _LoginModal extends State<LoginModal> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double modalHeight = MediaQuery.of(context).size.width / 1.6;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Card(
        margin: EdgeInsets.fromLTRB(25, modalHeight, 25, modalHeight),
        color: const Color.fromRGBO(27, 38, 44, 1).withOpacity(0.7),
        elevation: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                        child: TextField(
                          style: TextStyle(
                            fontFamily: Assets.fontsMontserratBlack,
                            color: Color(0xFFE5E5E5),
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Color.fromRGBO(15, 76, 117, 1),
                          ),
                          autocorrect: false,
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                        child: TextField(
                          style: TextStyle(
                            fontFamily: Assets.fontsMontserratBlack,
                            color: Color(0xFFE5E5E5),
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Color.fromRGBO(15, 76, 117, 1),
                          ),
                          autocorrect: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(20, 30, 20, 12),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          elevation: 15,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DashboardPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontFamily: Assets.fontsMontserratBlack,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
}
