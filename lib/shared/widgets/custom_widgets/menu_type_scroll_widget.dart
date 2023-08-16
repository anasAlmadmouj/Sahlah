// import 'package:flutter/material.dart';
// import 'package:sahlah/main.dart';
// import 'package:sahlah/models/menu_model.dart';
//
// class MenuTypeScroll extends StatelessWidget {
//   final List menuTypeList;
//   const MenuTypeScroll({
//     required this.menuTypeList,
//     super.key,
//   });
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           height: 140,
//           decoration: const BoxDecoration(
//               border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
//           child: ListView.separated(
//             padding: const EdgeInsets.only(left: 22, top: 22, right: 22),
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) => Column(
//               children: [
//                 Container(
//                   width: 80,
//                   height: 80,
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: index != 0
//                           ? Colors.grey.withOpacity(.2)
//                           : Colors.green),
//                   child: ImageIcon(
//                     AssetImage('${menuTypeList[index]}'),
//                     color: Colors.green,
//                   ),
//                 ),
//                 3.height,
//                 Text(
//                   menuList[index].name,
//                   style: const TextStyle(
//                       fontSize: 12, fontWeight: FontWeight.w600),
//                 ),
//               ],
//             ),
//             separatorBuilder: (context, index) => const SizedBox(
//               width: 10,
//             ),
//             itemCount: 4,
//           ),
//         ),
//       ),
//     );
//   }
// }