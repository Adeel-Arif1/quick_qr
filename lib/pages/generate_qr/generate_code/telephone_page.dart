import 'package:flutter/material.dart';
import 'package:quick_qr/pages/qr_display_page.dart';
import 'package:quick_qr/widgets/custom_appbar.dart';

class TelephonePage extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  TelephonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
       appBar: const CustomAppBar(
        title: 'Telephone',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.phone_android, size: 60, color: Colors.amber),
            const SizedBox(height: 20),
            TextField(
              controller: phoneController,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Enter Phone Number',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                final phone = phoneController.text.trim();
                final qrData = "tel:$phone"; // QR data format for phone call
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QRDisplayPage(qrData: qrData),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              icon: const Icon(Icons.qr_code, color: Colors.black),
              label: const Text('Generate QR Code',
                  style: TextStyle(color: Colors.black)),
            )
          ],
        ),
      ),
    );
  }
}
