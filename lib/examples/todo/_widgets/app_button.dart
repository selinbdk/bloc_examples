import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({required this.onPressed, required this.messages, super.key});

  final void Function()? onPressed;
  final String? messages;

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF50C2C9),
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Text(
        messages ?? '',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 8,
        ),
      ),
    );
  }
}
