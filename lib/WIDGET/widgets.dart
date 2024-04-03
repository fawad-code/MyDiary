import 'package:flutter/material.dart';
import 'package:hive_nosql_db/BOXES/box.dart';
import 'package:hive_nosql_db/MODEL/diarymodel.dart';

void delete(DiaryModel diaryModel) {
  diaryModel.delete();
}

Future<void> editDiary(
    BuildContext context,
    titleController,
    descriptionController,
    DiaryModel diaryModel,
    String title,
    String description) async {
  titleController.text = title;
  descriptionController.text = description;
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
                    hintText: 'Update Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Edit Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          title: const Text('Update Diary'),
          actions: [
            TextButton(
                onPressed: () {
                  diaryModel.title = titleController.text.toString();
                  diaryModel.save();
                  diaryModel.description = descriptionController.text.toString();
                  diaryModel.save();
                  Navigator.pop(context);
                },
                child: const Text(
                  'Update',
                  style: TextStyle(color: Colors.black),
                )),
          ],
        );
      });
}

Future<void> showMyDialog(
    BuildContext context, titleController, descriptionController) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.orange.shade100,
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
                  controller: descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Enter Description',
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
                onPressed: () {
                  final data = DiaryModel(
                      title: titleController.text,
                      description: descriptionController.text);
                  final box = Boxes.getNotesData();
                  box.add(data);
                  data.save();
                  titleController.clear();
                  descriptionController.clear();
                  Navigator.pop(context);
                },
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.black),
                )),
          ],
        );
      });
}
