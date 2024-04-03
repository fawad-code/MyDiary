import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_nosql_db/BOXES/box.dart';
import 'package:hive_nosql_db/MODEL/diarymodel.dart';
import 'package:hive_nosql_db/WIDGET/widgets.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Row(
          children: [
            Icon(
              Icons.book,
              color: Colors.black,
              size: 30,
            ),
            SizedBox(width: 8),
            Text(
              'My Diary',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 24),
            ),
          ],
        ),
      ),
      body: ValueListenableBuilder<Box<DiaryModel>>(
          valueListenable: Boxes.getNotesData().listenable(),
          builder: (context, box, _) {
            var data = box.values.toList().cast<DiaryModel>();
            return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(data[index].title.toString(),style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  editDiary(
                                      context,
                                      titleController,
                                      descriptionController,
                                      data[index],
                                      data[index].title.toString(),
                                      data[index].description.toString());
                                },
                                child: const Icon(Icons.edit),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                onTap: () {
                                  delete(data[index]);
                                },
                                child: const Icon(Icons.delete),
                              )
                            ],
                          ),
                          Text(data[index].description.toString()),
                        ],
                      ),
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          showMyDialog(context, titleController, descriptionController);
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
