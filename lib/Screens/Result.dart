import 'package:b_project/Screens/HomePage.dart';
import 'package:b_project/Widgets/AppDrawer.dart';
import 'package:b_project/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

import '../Widgets/Boxes.dart';
import '../model/results.dart';

class Result extends StatefulWidget {
  final int result;
  final String text;
  const Result({super.key, required this.result, required this.text});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  int count = 0;
  final List<String> entries = <String>[
    'GENRE',
    'MOOD',
    'TEMPO',
    'KEY',
    'DOMINANT INSTRUMENT',
  ];
  final List<String> categories = <String>[
    'GENRE',
    'MOOD',
    'TEMPO',
    'KEY',
    '  DOMINANT\nINSTRUMENT',
  ];

  Future saveResult() async {
    // final box = Hive.box<Results>('results');
    final result = Results()
      ..category = entries[widget.result]
      ..result = widget.text
      ..date = DateTime.now();
    // await box.add(result);
    final box = Boxes.getResults();
    box.add(result);
  }

  // @override
  // void dispose() {
  //   Hive.close();
  //   super.dispose();
  // }

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff8758FF),
        elevation: 0.0,
      ),
      drawer: const AppDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
        child: Column(
          children: [
            Wrap(
              runSpacing: 2,
              alignment: WrapAlignment.center,
              spacing: 50,
              children: List.generate(
                entries.length,
                (index) => GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 15),
                        child: Text(
                          categories[index],
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      Container(
                        width: 124,
                        height: 121,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/Vector1.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              child: Container(
                                width: 88,
                                height: 87,
                                decoration: BoxDecoration(
                                  image: index != widget.result
                                      ? const DecorationImage(
                                          image:
                                              AssetImage('assets/Vector2.png'),
                                          fit: BoxFit.cover,
                                        )
                                      : const DecorationImage(
                                          image: AssetImage(
                                              'assets/black_circle.png'),
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                            index != widget.result
                                ? const Text(
                                    'SPARK',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )
                                : Text(
                                    widget.text,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            count++;
                            if (count == 1) {
                              Fluttertoast.showToast(
                                  msg: 'Result Saved',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.white,
                                  textColor: Colors.black,
                                  fontSize: 16.0);
                              saveResult();
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'Result Already Saved',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.white,
                                  textColor: Colors.black,
                                  fontSize: 16.0);
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                                width: 1.0, color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            backgroundColor: const Color(0xff5CB8E4)),
                        child: const Text(
                          'Save Result',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        },
                        style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                                width: 1.0, color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                            backgroundColor: const Color(0xff5CB8E4)),
                        child: const Text(
                          'Repeat',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
