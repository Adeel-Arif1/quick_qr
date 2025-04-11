import 'package:flutter/material.dart';
import 'package:quick_qr/constants.dart';
import 'package:quick_qr/pages/qr_display_page.dart';
import 'package:quick_qr/widgets/custom_appbar.dart';
import 'package:quick_qr/widgets/custom_input_card.dart';

class EmailPage extends StatelessWidget {
  EmailPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarydarkBlack,
      appBar:CustomAppBar(
            title: 'Email'
          ),
      body: Center(
        child: CustomInputCard(
          topImageAsset: 'assets/icons/text_icon.png',
          labelText: 'Email Address or Message',
          buttonText: 'Generate QR Code',
          controller: _emailController,
          buttonIcon: const Icon(Icons.qr_code, color: Colors.black),
          onButtonPressed: () {
            final inputText = _emailController.text.trim();
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
