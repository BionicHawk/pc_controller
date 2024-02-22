import 'package:flutter/material.dart';

class MainHomeArt extends StatelessWidget {
  const MainHomeArt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black87,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.lightBlue, width: 8)),
      width: 300,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Image.asset(
          "assets/images/wirelessicon.png",
        ),
      ),
    );
  }
}
