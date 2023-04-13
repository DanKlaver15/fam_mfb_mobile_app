import 'dart:ui';

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);
  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(50, 130, 184, 1),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black26,
                  offset: Offset(10, 10),
                ),
              ],
            ),
            child: Card(
              color: const Color.fromRGBO(15, 76, 117, 1),
              elevation: 20,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      (title != null)
                          ? Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 30),
                              child: Text(
                                title!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0), fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            )
                          : const SizedBox(),
                      child,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
