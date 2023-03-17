import 'package:b_project/model/results.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

import '../Widgets/Boxes.dart';

class SaveResult extends StatefulWidget {
  const SaveResult({super.key});

  @override
  State<SaveResult> createState() => _SaveResultState();
}

class _SaveResultState extends State<SaveResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff8758FF),
        elevation: 0.0,
        title: const Text(
          'Save Result',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
              final results = box.values.toList().cast<Results>();
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
          style: TextStyle(fontSize: 24),
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
                final result = results[index];

                return buildResult(context, result);
              },
            ),
          ),
        ],
      );
    }
  }

  Widget buildResult(
    BuildContext context,
    Results result,
  ) {
    final date = DateFormat.yMMMd().format(result.date);

    return Card(
      color: Colors.white,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
        title: Text(
          result.category,
          maxLines: 2,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            result.result,
            style: const TextStyle(color: Colors.blueAccent, fontSize: 14),
          ),
        ),
        trailing: Text(
          date,
          style: const TextStyle(
              color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ),
    );
  }
}
