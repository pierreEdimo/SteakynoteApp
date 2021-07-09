import "package:flutter/material.dart";
import 'package:glassmorphism/glassmorphism.dart';

class GlassContainer extends StatelessWidget {
  final double? height;
  final Widget? child;
  final Color? color;
  const GlassContainer({Key? key, this.height, this.child, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(5),
      child: GlassmorphicContainer(
        width: MediaQuery.of(context).size.width * 1,
        height: height,
        borderRadius: 5,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color!.withOpacity(0.1),
              color!.withOpacity(0.2),
            ],
            stops: [
              0.1,
              1,
            ]),
        border: 0,
        blur: 20,
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color!.withOpacity(0.5),
            color!.withOpacity(0.5),
          ],
        ),
        child: child,
      ),
    );
  }
}
