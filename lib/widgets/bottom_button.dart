import 'package:flutter/material.dart';
import 'package:quick_qr/constants.dart';

class RoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final double borderRadius;

  const RoundedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color = const Color(0xFFFDB623), // Default yellow color
    this.borderRadius = 8.0, // Default border radius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 250,height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
