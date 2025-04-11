import 'package:flutter/material.dart';
import 'package:quick_qr/constants.dart';
import 'package:quick_qr/pages/qr_display_page.dart';
import 'package:quick_qr/widgets/custom_appbar.dart';
import 'package:quick_qr/widgets/custom_input_card.dart';

class InstagramPage extends StatelessWidget {
  InstagramPage({Key? key}) : super(key: key);

  final TextEditingController _instagramController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarydarkBlack,
      appBar:CustomAppBar(
            title: 'Instagram'
          ),
      body: Center(
        child: CustomInputCard(
          topImageAsset: 'assets/icons/text_icon.png',
          labelText: 'Instagram URL or Username',
          buttonText: 'Generate QR Code',
          controller: _instagramController,
          buttonIcon: const Icon(Icons.qr_code, color: Colors.black),
          onButtonPressed: () {
            final inputText = _instagramController.text.trim();
            if (inputText.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => QRDisplayPage(qrData: inputText),
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
