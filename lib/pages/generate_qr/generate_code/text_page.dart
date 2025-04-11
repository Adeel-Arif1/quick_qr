import 'package:flutter/material.dart';
import 'package:quick_qr/constants.dart';
import 'package:quick_qr/pages/qr_display_page.dart';
import 'package:quick_qr/widgets/custom_appbar.dart';
import 'package:quick_qr/widgets/custom_input_card.dart';

class TextPage extends StatefulWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarydarkBlack,
      
      appBar: CustomAppBar(
       
       title: 'Text',
      ),
      body: Center(
        child: CustomInputCard(
          topImageAsset: 'assets/icons/text_icon.png',
          labelText: 'Text',
          buttonText: 'Generate QR Code',
          controller: _textController,
          buttonIcon: const Icon(Icons.qr_code, color: Colors.black),
          onButtonPressed: () {
            final inputText = _textController.text.trim();
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
