import 'package:flutter/material.dart';

import 'app_button.dart';
import 'text_box.dart';

class DialogField extends StatelessWidget {
  const DialogField({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFD9D9D9),
      content: SizedBox(
        height: 300,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextBox(
              controller: controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                  ),
                  onPressed: () {
                    controller.text = '';
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: () {},
                    messages: 'Add',
                  ),
                ),
                Expanded(
                  child: AppButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      messages: 'Cancel'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
