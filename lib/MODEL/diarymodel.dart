
import 'package:hive/hive.dart';
part 'diarymodel.g.dart';


@HiveType(typeId: 0)
class DiaryModel  extends HiveObject {

  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  DiaryModel({required this.title, required this.description});
}
