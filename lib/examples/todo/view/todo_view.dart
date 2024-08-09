import 'package:flutter/material.dart';

import '../_widgets/dialog_field.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      body: Column(
        children: [
          ColoredBox(
            color: const Color(0xFF50C2C9),
            child: Image.asset('assets/images/Todo_image.png'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {},
                    leading: Checkbox(
                      value: false,
                      onChanged: (value) {},
                      activeColor: Colors.black,
                    ),
                    title: const Text(
                      'Selin',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                    subtitle: const Text(
                      'hello',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 5,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF50C2C9),
        onPressed: () {
          showDialog(context: context, builder: (context) => const DialogField());
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
