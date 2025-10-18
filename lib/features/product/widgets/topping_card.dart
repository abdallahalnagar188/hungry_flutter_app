// import 'package:flutter/material.dart';
//
// import 'package:flutter/material.dart';
//
// class ToppingCard extends StatelessWidget {
//   final String imagePath;
//   final String title;
//   final VoidCallback? onAdd;
//
//   const ToppingCard({
//     Key? key,
//     required this.imagePath,
//     required this.title,
//     this.onAdd,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 85,
//       height: 100,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(32),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 20,
//             offset: const Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // Image Container
//           Container(
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(32),
//                 topRight: Radius.circular(32),
//               ),
//             ),
//             child: Center(
//               child: Image.asset(
//                 imagePath,
//                 height: 100,
//                 width: 100,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//           // Bottom Section
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Color(0xFF3D3838),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(32),
//                   bottomRight: Radius.circular(32),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Title
//                     Text(
//                       title,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 22,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     // Add Button
//                     GestureDetector(
//                       onTap: onAdd,
//                       child: Container(
//
//                         decoration: BoxDecoration(
//                           color: const Color(0xFFE94A4A),
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: const Color(0xFFE94A4A).withOpacity(0.4),
//                               blurRadius: 8,
//                               offset: const Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                         child: const Icon(
//                           Icons.add,
//                           color: Colors.white,
//                           size: 28,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }