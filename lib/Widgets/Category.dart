// import 'dart:math';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class Category extends StatefulWidget {
//   const Category({super.key});

//   @override
//   State<Category> createState() => _CategoryState();
// }

// class _CategoryState extends State<Category> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//       decoration: const BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage("assets/Splash.png"), fit: BoxFit.cover)),
//       // color: Colors.white,
//       alignment: Alignment.center,
//       child: Container(
//         alignment: Alignment.center,
//         child: GestureDetector(
//           onTap: () {},
//           child: Column(
//             children: [
//               const Padding(
//                 padding: EdgeInsets.only(bottom: 8.0),
//                 child: Text(
//                   'TEMPO',
//                   // categoryList[index]['title'],
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18),
//                 ),
//               ),
//               Container(
//                 width: 124,
//                 height: 121,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   image: DecorationImage(
//                     image: AssetImage('assets/Vector1.png'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     ClipRRect(
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(15),
//                       ),
//                       child: Container(
//                         width: 88,
//                         height: 87,
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage('assets/Vector2.png'),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(top: 8.0),
//                       child: Text(
//                         'SPARK',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
