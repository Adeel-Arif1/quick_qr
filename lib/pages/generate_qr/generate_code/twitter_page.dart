import 'package:flutter/material.dart';
import 'package:quick_qr/constants.dart';
import 'package:quick_qr/pages/qr_display_page.dart';
import 'package:quick_qr/widgets/custom_appbar.dart';
import 'package:quick_qr/widgets/custom_input_card.dart';

class TwitterPage extends StatelessWidget {
  TwitterPage({Key? key}) : super(key: key);

  final TextEditingController _twitterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarydarkBlack,
      appBar: CustomAppBar(
            title: 'Twitter'
          ),
      body: Center(
        child: CustomInputCard(
          topImageAsset: 'assets/icons/text_icon.png',
          labelText: 'Twitter URL or Username',
          buttonText: 'Generate QR Code',
          controller: _twitterController,
          buttonIcon: const Icon(Icons.qr_code, color: Colors.black),
          onButtonPressed: () {
            final inputText = _twitterController.text.trim();
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
