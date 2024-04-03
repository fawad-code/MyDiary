import 'package:flutter/material.dart';

Future<void> showMyDialog(
    BuildContext context, titleController, descriptionController) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.orange.shade200,
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Enter Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Enter Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          title: const Text('Write in Diary'),
          actions: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.orange),
                )),
          ],
        );
      });
}
