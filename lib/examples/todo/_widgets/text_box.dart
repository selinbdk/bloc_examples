import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox({required this.controller,super.key});


final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: 5,
      maxLines: 5,
      style: const TextStyle(
        fontSize: 8,
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      cursorHeight: 30,
      decoration: InputDecoration(
        hintText: 'Add new todo!',
        hintStyle: const TextStyle(
          color: Colors.black,
          fontSize: 8,
        ),
        fillColor: const Color(0xFFD9D9D9),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
