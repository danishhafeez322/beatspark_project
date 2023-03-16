import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'Screens/Result.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(
        duration: 2,
        gotoPage: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> entries = <String>[
    'GENRE',
    'MOOD',
    'TEMPO',
    'KEY',
    '  DOMINANT\nINSTRUMENT',
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
  final List<String> tempo = <String>[
    'SLOW',
    'MODERATELY SLOW',
    'MID-TEMPO',
    'MODERATELY FAST',
    'FAST',
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
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/Splash.png"), fit: BoxFit.cover),
        ),
        child: Wrap(
          runSpacing: 2,
          alignment: WrapAlignment.center,
          spacing: 50,
          children: List.generate(
            entries.length,
            (index) => GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(
                              result: index,
                            )));
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
