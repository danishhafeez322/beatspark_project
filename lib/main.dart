import 'package:b_project/Screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'Screens/SplashScreen.dart';
import 'model/results.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(ResultsAdapter());
  await Hive.openBox<Results>('results');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(
        duration: 2,
        gotoPage: const HomePage(),
      ),
    );
  }
}
