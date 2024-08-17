import 'package:flutter/material.dart';

extension SnackBarManager on BuildContext {
  void showErrorMessage({
    required String message,
  }) {
    final snackBar = SnackBar(
      content: Text(
        message,
        maxLines: 1,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize:10,
        ),
      ),
      backgroundColor: const Color(0xFF50C2C9),
    );

    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
