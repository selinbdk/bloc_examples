import 'package:flutter/material.dart';

import 'app_button.dart';
import 'text_box.dart';

class DialogField extends StatefulWidget {
  const DialogField({super.key});

  @override
  State<DialogField> createState() => _DialogFieldState();
}

class _DialogFieldState extends State<DialogField> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
            TextBox(controller: controller),
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
