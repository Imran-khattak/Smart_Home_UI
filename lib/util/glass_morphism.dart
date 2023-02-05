import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:smarthome_ui/util/app_color.dart';

class GlassMorphism extends StatelessWidget {
  final Widget child;
  const GlassMorphism({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Appcolor.fgColor.withOpacity(.9),
                    Appcolor.black.withOpacity(0.5),
                    Appcolor.fgColor.withOpacity(0.5),
                  ],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                ),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: child,
            )));
  }
}
