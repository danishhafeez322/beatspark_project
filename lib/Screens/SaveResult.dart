import 'package:b_project/model/results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

import '../Widgets/Boxes.dart';

class SaveResult extends StatefulWidget {
  const SaveResult({super.key});

  @override
  State<SaveResult> createState() => _SaveResultState();
}

class _SaveResultState extends State<SaveResult> {
  final List<String> entries = <String>[
    'GENRE',
    'MOOD',
    'TEMPO',
    'KEY',
    'DOMINANT\nINSTRUMENT',
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
        title: const Text(
          'Save Result',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontFamily: 'Poppins', fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: ValueListenableBuilder<Box<Results>>(
            valueListenable: Boxes.getResults().listenable(),
            builder: (context, box, _) {
              var results = box.values.toList().cast<Results>();
              return buildContent(results);
            },
          ),
        ),
      ),
    );
  }

  Widget buildContent(List<Results> results) {
    if (results.isEmpty) {
      return const Center(
        child: Text(
          'No Results yet!',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Poppins',
          ),
        ),
      );
    } else {
      return Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              itemCount: results.length,
              itemBuilder: (BuildContext context, int index) {
                var result = results[index];
                final date = DateFormat.yMMMd().format(result.date);
                final time = DateFormat('hh:mm a').format(result.date);

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Slidable(
                    endActionPane: ActionPane(
                        motion: BehindMotion(),
                        extentRatio: 0.3,
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              Boxes.getResults().deleteAt(index);
                            },
                            label: 'Delete',
                            icon: Icons.delete,
                            backgroundColor: Colors.red,
                          )
                        ]),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      // width: MediaQuery.of(context).size.width * 0.8,

                      padding: const EdgeInsets.only(top: 10, left: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.28,
                            child: Column(children: [
                              ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: result.result.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return result.result[index] != ''
                                      ? Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            entries[index],
                                            style: const TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      : Container();
                                },
                              ),
                            ]),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.28,
                            child: Column(children: [
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: result.result.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return result.result[index] != ''
                                      ? Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            result.result[index],
                                            style: const TextStyle(
                                                fontSize: 11,
                                                fontFamily: 'Poppins',
                                                color: Colors.blue),
                                          ),
                                        )
                                      : Container();
                                },
                              ),
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 28.0),
                            child: Column(
                              children: [
                                Text(
                                  date,
                                  style: const TextStyle(color: Colors.black54),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  time,
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );

                // return buildResult(context, result);
              },
            ),
          ),
        ],
      );
    }
  }
}
