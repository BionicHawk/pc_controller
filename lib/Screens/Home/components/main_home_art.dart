import 'package:flutter/material.dart';

class MainHomeArt extends StatelessWidget {
  const MainHomeArt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double width = 240;
    const double height = 240;

    return Container(
      decoration: BoxDecoration(
          color: Colors.black87,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.lightBlue, width: 8)
      ),
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Image.asset(
          "assets/images/wirelessicon.png",
        ),
      ),
    );
  }
}
