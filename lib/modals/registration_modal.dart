import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/generated/assets.dart';

class RegistrationModal extends StatefulWidget {
  const RegistrationModal({Key? key}) : super(key: key);

  _RegistrationModal createState() => _RegistrationModal();
}

class _RegistrationModal extends State<RegistrationModal> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double modalHeight = MediaQuery.of(context).size.width / 2.5;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Card(
        margin: EdgeInsetsDirectional.fromSTEB(25, modalHeight, 25, modalHeight),
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
                            height: 1,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'First Name',
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
                            hintText: 'Last Name',
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
                          print('Button pressed ...');
                        },
                        child: const Text(
                          'Register',
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
