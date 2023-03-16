import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 15, right: 15),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                CircleAvatar(
                  backgroundColor: const Color(0xff8758FF),
                  radius: 20,
                  child: IconButton(
                    icon: const Icon(Icons.close_sharp),
                    // alignment: Alignment.topRight,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.white,
                  ),
                ),
              ])),
          ListTile(
            leading: const Icon(
              Icons.help,
              color: Colors.blueAccent,
            ),
            title: const Text('Help'),
            onTap: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(left: 35, right: 35),
            child: Divider(
              color: Colors.black45,
              thickness: 1,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.message,
              color: Colors.blueAccent,
            ),
            title: const Text('Term & Conditions'),
            onTap: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(left: 35, right: 35),
            child: Divider(
              color: Colors.black45,
              thickness: 1,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.file_open_rounded,
              color: Colors.blueAccent,
            ),
            title: const Text('Save Results'),
            onTap: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(left: 35, right: 35),
            child: Divider(
              color: Colors.black45,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
