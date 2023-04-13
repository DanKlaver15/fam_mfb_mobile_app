import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/generated/assets.dart';
import 'package:http/http.dart' as http;

class AddUserResultModal extends StatefulWidget {
  const AddUserResultModal({super.key, required this.statusCode});

  final int statusCode;

  @override
  State<AddUserResultModal> createState() => _AddUserResultModal();
}

class _AddUserResultModal extends State<AddUserResultModal> {
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.statusCode == 201
                    ? const Text(
                        'Account successfully created.\nPlease check your email for a verification link.',
                        style: TextStyle(
                            fontFamily: Assets.fontsMontserratBlack,
                            color: Color(0xFFE5E5E5),
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      )
                    : const Text(
                        'Unable to create account. Please ensure you are connected to the internet and try again.',
                        style: TextStyle(
                            fontFamily: Assets.fontsMontserratBlack,
                            color: Color(0xFFE5E5E5),
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
