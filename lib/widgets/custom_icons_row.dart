// import 'package:flutter/material.dart';
// import 'package:quick_qr/constants.dart'; // Import _IconTextData

// class IconTextRow extends StatelessWidget {
//   final List<_IconTextData> items;

//   const IconTextRow({required this.items, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Center with space
//       children: items.map((item) => _buildIconText(item)).toList(),
//     );
//   }

//   Widget _buildIconText(_IconTextData item) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Image.asset(item.iconPath, width: 50, height: 50), // Icon
//         const SizedBox(height: 8),
//         Text(
//           item.label,
//           style: const TextStyle(color: Colors.yellow), // Yellow text
//         ),
//       ],
//     );
//   }
// }
