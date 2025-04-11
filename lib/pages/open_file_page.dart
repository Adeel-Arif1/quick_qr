
import 'package:flutter/material.dart';
import 'package:quick_qr/constants.dart';

import '../widgets/bottom_navigation_bar.dart';
import '../widgets/custom_appbar.dart';

class OpenFilePage extends StatelessWidget {
  const OpenFilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color(0xFF2B2A2A), // Dark background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [SizedBox(height: 20,),
            
            CustomAppBar(
        title: "Result",
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      SizedBox(height: 45,),
            // Container with QR icon, data, and details
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // QR Icon
                  Row(
                    children: [
                      Image.asset(
                        'assets/splash_qrr.png',
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "Data",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Date Text
                  const Text(
                    "16 Dec 2024, 9:30 pm",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Divider Line
                  const Divider(
                    color: Colors.yellow,
                    thickness: 2,
                  ),
                  const SizedBox(height: 8),
                  // Link
                  const Text(
                    "https://www.youtube.com/watch?v=Zd9g7sHQv2M",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Show QR Code Text
                  Center(
                    child: const Text(
                      "Show QR Code",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Buttons: Share and Copy
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Share Button
                ElevatedButton.icon(
                  onPressed: () {
                    print("Share Button Pressed");
                  },
                  icon: const Icon(Icons.share, color: Colors.black),
                  label: const Text(
                    "Share",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 20.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                // Copy Button
                ElevatedButton.icon(
                  onPressed: () {
                    print("Copy Button Pressed");
                  },
                  icon: const Icon(Icons.copy, color: Colors.black),
                  label: const Text(
                    "Copy",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 20.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),


      
      bottomNavigationBar: BottomNavBar(
                
                ) ,
    );
  }
}

// class CustomAppBar extends StatelessWidget  {
//   final String? title;
//   final VoidCallback? onBackPressed;

//   const CustomAppBar({
//     super.key,
//     this.title,
//     this.onBackPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//       color: Colors.black87, // Dark black background
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Row(
//         children: [
//           // Back Icon
//           GestureDetector(
//             onTap: onBackPressed ?? () => Navigator.of(context).pop(),
//             child: const Icon(
//               Icons.arrow_back,
//               color: Colors.yellow,
//               size: 28,
//             ),
//           ),
//           const SizedBox(width: 16), // Empty space after the back icon
//           // Optional Title
//           if (title != null)
//             Expanded(
//               child: Text(
//                 title!,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 overflow: TextOverflow.ellipsis, // Handle long text gracefully
//                 maxLines: 1,
//               ),
//             ),
//         ],
//       ),
//     );
//   }


// }
