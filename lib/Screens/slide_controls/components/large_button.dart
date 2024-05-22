import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  const LargeButton({super.key, required this.icon, this.onPressed});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade400,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
      ),
      onPressed: onPressed, 
      child: SizedBox(
        height: 120,
        child: Icon(
          icon, 
          size: 30,
          color: Colors.white,
        )
      ),
    );
  }
}