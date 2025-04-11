import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final VoidCallback onGalleryPressed;
  final VoidCallback onTorchPressed;
  final VoidCallback onCameraSwitchPressed;

  const TopBar({
    Key? key,
    required this.onGalleryPressed,
    required this.onTorchPressed,
    required this.onCameraSwitchPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.photo, color: Colors.white),
              onPressed: onGalleryPressed,
            ),
            IconButton(
              icon: const Icon(Icons.flash_on, color: Colors.white),
              onPressed: onTorchPressed,
            ),
            IconButton(
              icon: const Icon(Icons.cameraswitch, color: Colors.white),
              onPressed: onCameraSwitchPressed,
            ),
          ],
        ),
      ),
    );
  }
}
