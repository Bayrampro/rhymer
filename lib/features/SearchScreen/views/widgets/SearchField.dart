//
// import 'package:flutter/material.dart';
//
// class SearchField extends StatefulWidget {
//   const SearchField({
//     Key? key,
//     required this.onTap,
//     required this.controller
//   }) : super(key: key);
//
//   final TextEditingController controller;
//   final VoidCallback onTap;
//
//   @override
//   State<SearchField> createState() => _SearchFieldState();
// }
//
// class _SearchFieldState extends State<SearchField> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return GestureDetector(
//       onTap: widget.onTap,
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 15,),
//         padding: EdgeInsets.all(19),
//         child: Row(
//           children: [
//             Icon(Icons.search_outlined),
//             SizedBox(width: 7,),
//             AnimatedBuilder(
//                 animation: widget.controller,
//                 builder: (BuildContext context, Widget? child){
//                   return Text(
//                     widget.controller.text.isEmpty ? 'Search rhymes...' : widget.controller.text,
//                     style: TextStyle(
//                         color: Colors.black.withOpacity(0.5)
//                     ),
//                   );
//                 }
//             )
//           ],
//         ),
//         width: double.infinity,
//         height: 60.0,
//         decoration: BoxDecoration(
//           color: theme.hintColor.withOpacity(0.13),
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//     );
//   }
// }