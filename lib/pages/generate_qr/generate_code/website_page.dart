import 'package:flutter/material.dart';
import 'package:quick_qr/constants.dart';
import 'package:quick_qr/pages/qr_display_page.dart'; // <-- assuming you're navigating here
import 'package:quick_qr/widgets/custom_appbar.dart';
import 'package:quick_qr/widgets/custom_input_card.dart';

class WebsitePage extends StatelessWidget {
  WebsitePage({Key? key}) : super(key: key);

  final TextEditingController _websiteController = TextEditingController(); // ✅ Add controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarydarkBlack,
      appBar: CustomAppBar(
            title: 'Website',
          ),
      body: Center(
        child: CustomInputCard(
          topImageAsset: 'assets/icons/website_icon.png',
          labelText: 'Website',
          buttonText: 'Generate QR Code',
          controller: _websiteController, // ✅ Pass the controller
          buttonIcon: const Icon(Icons.qr_code, color: Colors.black),
          onButtonPressed: () {
            final websiteText = _websiteController.text.trim(); // ✅ Get the text
            if (websiteText.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => QRDisplayPage(qrData: websiteText),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter some text')),
              );
            }
          },
        ),
      ),
    );
  }
}
