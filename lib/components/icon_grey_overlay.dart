import 'package:flutter/material.dart';

class IconOverlay extends StatelessWidget {
  const IconOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(60, 66, 74, 0.7),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
