import 'package:flutter/material.dart';

class CustomDualInputCard extends StatelessWidget {
  final String topImageAsset; // Path for the top image asset
  final String firstHintText; // Hint text for the first input field
  final String secondHintText; // Hint text for the second input field
  final String buttonText; // Text for the button
  final VoidCallback onButtonPressed; // Callback when button is pressed
  final Widget? buttonIcon; // Optional icon for the button

  const CustomDualInputCard({
    required this.topImageAsset,
    required this.firstHintText,
    required this.secondHintText,
    required this.buttonText,
    required this.onButtonPressed,
    this.buttonIcon,
    Key? key, required Null Function(dynamic value) onSecondTextChanged, required Null Function(dynamic value) onFirstTextChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: 320,
      decoration: BoxDecoration(
        color: const Color(0xFF1F1F1F), // Background color
        border: const Border(
          top: BorderSide(color: Color(0xFFFFA800), width: 4), // Yellow top border
          bottom: BorderSide(color: Color(0xFFFFA800), width: 4), // Yellow bottom border
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Card(
        elevation: 6,
        margin: EdgeInsets.zero, // Ensure the card fits the container
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.transparent, // Make the card color transparent
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top Image
              Image.asset(
                topImageAsset,
                height: 80,
              ),
              const SizedBox(height: 16),

              // First Text Field
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: firstHintText,
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                  filled: true,
                  fillColor: const Color(0xFF333333),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Second Text Field
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: secondHintText,
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                  filled: true,
                  fillColor: const Color(0xFF333333),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Generate QR Code Button
              ElevatedButton.icon(
                onPressed: onButtonPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFA800), // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
                icon: buttonIcon ?? const SizedBox(),
                label: Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
