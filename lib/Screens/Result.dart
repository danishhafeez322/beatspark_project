import 'package:b_project/main.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final int result;
  const Result({super.key, required this.result});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  final List<String> entries = <String>[
    'TEMPO',
    'MOOD',
    'GENRE',
    'KEY',
    '  DOMINANT\nINSTRUMENT',
  ];
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
                image: AssetImage("assets/Splash.png"), fit: BoxFit.cover)),
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
                        onPressed: () {},
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
                                  builder: (context) => const MyHomePage()));
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
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: ElevatedButton.icon(
            //     onPressed: () {},
            //     icon: const Icon(Icons.repeat_outlined),
            //     label: const Text('Repeat'),
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: const Color(0xff5CB8E4)),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
