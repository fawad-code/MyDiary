import 'package:hive/hive.dart';
import 'package:hive_nosql_db/MODEL/diarymodel.dart';

class Boxes {

  static Box<DiaryModel> getNotesData() => Hive.box<DiaryModel>('diaryBox');

}