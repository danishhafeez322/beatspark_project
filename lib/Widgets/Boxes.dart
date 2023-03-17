import 'package:b_project/Screens/Result.dart';
import 'package:hive/hive.dart';

import '../model/results.dart';

class Boxes {
  static Box<Results> getResults() => Hive.box<Results>('results');
}
