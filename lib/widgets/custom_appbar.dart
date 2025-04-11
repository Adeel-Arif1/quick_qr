import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title; // Optional text
  final VoidCallback? onBackPressed; // Callback for back button

  const CustomAppBar({
    Key? key,
    this.title,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical:28 ),
      child: Row(
        
        children: [
          // Back Icon with black background
          Container(
            decoration: BoxDecoration(
              color: Colors.black87, // Black background for the back icon
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            padding: const EdgeInsets.all(8), // Padding around the icon
            child: GestureDetector(
              onTap: onBackPressed ?? () => Navigator.of(context).pop(),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.yellow,
                size: 28,
              ),
            ),
          ),
          const SizedBox(width: 16), // Empty space after the back icon
          // Optional Title
          if (title != null)
            Expanded(
              child: Text(
                title!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,fontStyle: FontStyle.italic
                ),
                overflow: TextOverflow.ellipsis, // Handle long text gracefully
                maxLines: 1,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
