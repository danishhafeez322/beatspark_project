import 'package:hive/hive.dart';
part 'results.g.dart';

@HiveType(typeId: 0)
class Results extends HiveObject {
  @HiveField(0)
  late List<String> result;
  @HiveField(1)
  late DateTime date;
}
