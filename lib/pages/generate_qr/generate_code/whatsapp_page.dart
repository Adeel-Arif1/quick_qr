import 'package:flutter/material.dart';
import 'package:quick_qr/constants.dart';
import 'package:quick_qr/pages/qr_display_page.dart'; 
import 'package:quick_qr/widgets/custom_appbar.dart';
import 'package:quick_qr/widgets/custom_input_card.dart';

class WhatsappPage extends StatelessWidget {
  WhatsappPage({Key? key}) : super(key: key); 

  final TextEditingController _whatsappController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarydarkBlack,
    appBar:CustomAppBar(
            title: 'WhatsApp'
          ),
      body: Center(
        child: CustomInputCard(
          topImageAsset: 'assets/icons/whatsapp.png', 
          labelText: 'WhatsApp Number or Message',
          buttonText: 'Generate QR Code',
          controller: _whatsappController, 
          buttonIcon: const Icon(Icons.qr_code, color: Colors.black),
          onButtonPressed: () {
            final inputText = _whatsappController.text.trim(); 
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
