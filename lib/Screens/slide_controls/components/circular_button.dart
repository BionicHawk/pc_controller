import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({super.key, this.onPressed, required this.icon});

  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    
    return FloatingActionButton(
      shape: const OvalBorder(),
      elevation: 2,
      backgroundColor: Colors.blue.shade400,
      foregroundColor: Colors.white,
      onPressed: onPressed, 
      child: Icon(icon, size: 32)
    );
  }
}