import 'package:flutter/material.dart';

class CustomRowWidget extends StatelessWidget {
  final List<ItemData> items;

  const CustomRowWidget({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items.map((item) {
        return GestureDetector(
          onTap: item.onPressed, // Handle onPressed callback
          child: Column(
            children: [
              // Container with yellow border and full-image background
              Container(
                decoration: BoxDecoration(
                  color: Colors.black87,
                  border: Border.all(color: Colors.yellow, width: 2), // Yellow border
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                  image: DecorationImage(
                    image: AssetImage(item.imagePath),
                    fit: BoxFit.cover, // Fill the container with the image
                  ),
                ),
                height: 75,
                width: 75,
              ),
              const SizedBox(height: 8), // Space between container and text
              // Text below the container
              Text(
                item.text,
                style: const TextStyle(
                  color: Colors.yellow, // Yellow text
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class ItemData {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;

  ItemData({
    required this.imagePath,
    required this.text,
    required this.onPressed,
  });
}
















//other style 




// import 'package:flutter/material.dart';

// class CustomRowWidget extends StatelessWidget {
//   final List<ItemData> items;

//   const CustomRowWidget({
//     Key? key,
//     required this.items,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: items.map((item) {
//         return GestureDetector(
//           onTap: item.onPressed, // Handle onPressed callback
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.black87,
//               borderRadius: BorderRadius.circular(12), // Rounded corners
//             ),
//             height: 75,
//             width: 75,
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Image in the center
//                   Image.asset(
//                     item.imagePath,
//                     height: 40,
//                     width: 40,
//                   ),
//                   const SizedBox(height: 4), // Space between image and text
//                   // Text below the image
//                   Text(
//                     item.text,
//                     style: const TextStyle(
//                       color: Colors.yellow, // Example: yellow color
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

// class ItemData {
//   final String imagePath;
//   final String text;
//   final VoidCallback onPressed;

//   ItemData({
//     required this.imagePath,
//     required this.text,
//     required this.onPressed,
//   });
// }
