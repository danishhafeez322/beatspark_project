import 'package:hive/hive.dart';
part 'results.g.dart';

@HiveType(typeId: 0)
class Results extends HiveObject {
  @HiveField(0)
  late String category;
  @HiveField(1)
  late String result;
  @HiveField(2)
  late DateTime date;
}
