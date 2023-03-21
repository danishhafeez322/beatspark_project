import 'dart:math';

import 'package:b_project/Widgets/AppDrawer.dart';
import 'package:flutter/material.dart';

import 'Result.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String randomText = "";
  final List<String> entries = <String>[
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
              image: AssetImage("assets/background.png"), fit: BoxFit.cover),
        ),
        child: Wrap(
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

                // print(list[index].length);

                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => Result(
                //               result: index,
                //               text: randomText,
                //             )));
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 15),
                    child: Text(
                      entries[index],
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
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/Vector2.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          'SPARK',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
