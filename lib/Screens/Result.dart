import 'package:b_project/Screens/HomePage.dart';
import 'package:b_project/Widgets/AppDrawer.dart';
import 'package:b_project/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'dart:math';

import '../Widgets/Boxes.dart';
import '../model/results.dart';

class Result extends StatefulWidget {
  // final int result;
  // final String text;
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  int count = 0;
  String randomText = "";
  bool show = false;

  List<bool> flag = [false, false, false, false, false];
  List<String> resultText = ['', '', '', '', ''];

  final List<String> entries = <String>[
    'GENRE',
    'MOOD',
    'TEMPO',
    'KEY',
    'DOMINANT\nINSTRUMENT',
  ];
  final List<String> categories = <String>[
    'GENRE',
    'MOOD',
    'TEMPO',
    'KEY',
    '  DOMINANT\nINSTRUMENT',
  ];
  final List<String> tempo = <String>[
    'SLOW',
    'MODERATELY\nSLOW',
    'MID-TEMPO',
    'MODERATELY\nFAST',
    'FAST',
  ];

  final List<String> dominantInstruments = <String>[
    'FLUTE',
    'PADS',
    'SYNTHS',
    'PIANO',
    'GUITAR',
    'BRASS',
    'STRINGS',
    'PLUCKS',
  ];
  final List<String> genre = <String>[
    'PLUG',
    'DRILL',
    'BOOM-BAP',
    'LOFI R&B',
    'LOFI HIP-HOP',
    'BAY AREA',
    'TRAP',
    'DANCEHALL',
  ];
  final List<String> key = <String>[
    'C',
    'C#',
    'D',
    'D#',
    'E',
    'F',
    'F#',
    'G',
    'G#',
    'A',
    'A#',
    'B',
  ];
  final List<String> mood = <String>[
    'HAPPY',
    'INSPIRATIONAL',
    'SAD',
    'PARTY',
    'SEXY',
    'STONED',
    'DARK',
    'CONFIDENT',
    'CHILL',
    'ANGRY',
    'ROMANTIC',
  ];

  Future saveResult() async {
    final result = Results()
      ..result = resultText.toList()
      ..date = DateTime.now();
    final box = Boxes.getResults();
    await box.add(result);
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
                  onTap: () {
                    var random = Random();

                    switch (index) {
                      case 0:
                        int length = genre.length;
                        int randomNumber = random.nextInt(length);
                        // print(genre[randomNumber]);
                        randomText = genre[randomNumber];
                        break;
                      case 1:
                        int length = mood.length;
                        int randomNumber = random.nextInt(length);
                        randomText = (mood[randomNumber]);
                        break;
                      case 2:
                        int length = tempo.length;
                        int randomNumber = random.nextInt(length);
                        randomText = (tempo[randomNumber]);
                        break;
                      case 3:
                        int length = key.length;
                        int randomNumber = random.nextInt(length);
                        randomText = (key[randomNumber]);
                        break;
                      case 4:
                        int length = dominantInstruments.length;
                        int randomNumber = random.nextInt(length);
                        randomText = (dominantInstruments[randomNumber]);
                        break;
                    }
                    setState(() {
                      show = true;
                      flag[index] = true;
                      if (resultText[index] == '') {
                        resultText[index] = randomText;
                      }
                    });
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 15),
                        child: Text(
                          categories[index],
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
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
                                  image: flag[index] != true
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
                            flag[index] != true
                                ? const Text(
                                    'SPARK',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
                                        fontSize: 18),
                                  )
                                : Text(
                                    resultText[index],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins',
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
            show == true
                ? Padding(
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
                                  if (count == 1 && checkSave()) {
                                    saveResult();

                                    Fluttertoast.showToast(
                                        msg: 'Result Saved',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.white,
                                        textColor: Colors.black,
                                        fontSize: 16.0);
                                  } else if (!checkSave()) {
                                    Fluttertoast.showToast(
                                        msg: 'Select one to be Saved',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.white,
                                        textColor: Colors.black,
                                        fontSize: 16.0);
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
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold),
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
                                setState(() {
                                  count = 0;
                                  for (int i = 0; i < 5; i++) {
                                    flag[i] = false;
                                    resultText[i] = '';
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
                                'Repeat',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  bool checkSave() {
    for (int i = 0; i < 5; i++) {
      if (flag[i] == true) {
        return true;
      }
    }
    return false;
  }
}
