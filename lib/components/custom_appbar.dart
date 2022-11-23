import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key, required this.elevation}) : super(key: key);

  final double elevation;
  _CustomAppBar createState() => _CustomAppBar();
}

class _CustomAppBar extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(27, 38, 44, 1),
      automaticallyImplyLeading: false,
      title: const Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
        child: Text(
          'My Full Breath',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFE5E5E5),
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
      ),
      actions: const [],
      centerTitle: true,
      elevation: widget.elevation,
    );
  }
}
