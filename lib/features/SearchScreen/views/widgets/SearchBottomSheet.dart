// import 'package:flutter/material.dart';
//
// class SearchBottomSheet extends StatefulWidget {
//   const SearchBottomSheet({Key? key, required this.controller}) : super(key: key);
//
//   final TextEditingController controller;
//
//   @override
//   State<SearchBottomSheet> createState() => _SearchBottomSheetState();
// }
//
// class _SearchBottomSheetState extends State<SearchBottomSheet> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Column(
//       children: [
//         Container(
//           padding: EdgeInsets.fromLTRB(10, 13, 10, 10),
//           decoration: BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(
//                   color: Colors.grey[300]!, // Цвет рамки
//                   width: 2.0, // Толщина рамки
//                 ),
//               )
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   child: TextField(
//                     controller: widget.controller,
//                     decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide.none,
//                         ),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide.none,
//                         ),
//                         contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                         hintText: 'Start to type words...',
//                         hintStyle: TextStyle(
//                           color: theme.hintColor.withOpacity(0.5),
//                         )
//                     ),
//                   ),
//                   decoration: BoxDecoration(
//                       color: theme.hintColor.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(12)
//                   ),
//                 ),
//               ),
//               SizedBox(width: 8),
//               GestureDetector(
//                 onTap: (){
//                   Navigator.of(context).pop(widget.controller.text);
//                 },
//                 child: Container(
//                   width: 48,
//                   height: 48,
//                   decoration: BoxDecoration(
//                     color: theme.primaryColor,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Icon(Icons.search, color: Colors.white,),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//             child: ListView.separated(
//                 itemBuilder: (context, index) =>
//                     Container(
//                       child: Text(
//                         'Autocomplete Words',
//                         style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400),
//                       ),
//                       padding: index == 0 ? EdgeInsets.only(left: 10, top: 8) : EdgeInsets.only(left: 10),
//                     ),
//                 separatorBuilder: (context, _) => Divider(color: theme.dividerTheme.color,),
//                 itemCount: 20
//             )
//         ),
//       ],
//     );
//   }
// }
