import 'package:flutter/material.dart';

void errMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
      .showSnackBar(
      SnackBar(
        content: Row(
          spacing: 8.0,
          children: [
            Icon(Icons.error_outline_rounded, color: Colors.red,),
            Expanded(
              child: Text(message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        duration: Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        elevation: 8.0,
        backgroundColor: Color.fromARGB(240, 40, 40, 40),
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      )
  );
}