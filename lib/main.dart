import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_nosql_db/MODEL/diarymodel.dart';
import 'package:hive_nosql_db/SCREEN/DiaryScreen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(DiaryModelAdapter());
  await Hive.openBox<DiaryModel>('diaryBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HIVE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DiaryScreen(),
    );
  }
}
