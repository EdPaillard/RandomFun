// import 'package:flutter/material.dart';
// import 'package:front_rf/utilities/constants.dart';

// class DrawWidget extends StatelessWidget {
//   const DrawWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTile(
//       onExpansionChanged: (value) => setState(() {
//         collapsed = !collapsed;
//       }),
//       collapsedBackgroundColor: strawberry,
//       backgroundColor: cream,
//       collapsedIconColor: cream,
//       iconColor: strawberry,
//       title: collapsed
//           ? const Text(
//               "Materiel",
//               style: TextStyle(
//                 color: cream,
//                 fontFamily: 'Captain',
//                 fontSize: 25,
//               ),
//             )
//           : const Text(
//               "Materiel",
//               style: TextStyle(
//                 color: strawberry,
//                 fontFamily: 'Captain',
//                 fontSize: 25,
//               ),
//             ),
//       children: [
//         for (var materiel in gameMateriel)
//           ListTile(
//             hoverColor: drawColor,
//             selectedTileColor: drawColor,
//             title: Text(
//               materiel,
//               style: const TextStyle(
//                 color: strawberry,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 15,
//               ),
//               textAlign: TextAlign.left,
//             ),
//           ),
//       ],
//     );
//   }
// }
