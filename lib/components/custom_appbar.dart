import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar(
      {Key? key, required this.elevation, this.hasBackButton = false, this.hasDrawer = false})
      : super(key: key);

  final double elevation;
  final bool hasBackButton;
  final bool hasDrawer;

  @override
  State<CustomAppBar> createState() => _CustomAppBar();
}

class _CustomAppBar extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(27, 38, 44, 1),
      automaticallyImplyLeading: false,
      leading: widget.hasBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : widget.hasDrawer
              ? IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                )
              : null,
      title: const Text(
          'My Full Breath',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFE5E5E5),
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
      actions: const [],
      centerTitle: true,
      elevation: widget.elevation,
    );
  }
}
