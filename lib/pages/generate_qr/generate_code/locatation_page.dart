import 'package:flutter/material.dart';
import 'package:quick_qr/pages/qr_display_page.dart';
import 'package:quick_qr/widgets/custom_appbar.dart';

class LocationPage extends StatelessWidget {
  final TextEditingController latController = TextEditingController();
  final TextEditingController lngController = TextEditingController();

  LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
     appBar: const CustomAppBar(
        title: 'Location',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.location_on, size: 60, color: Colors.amber),
            const SizedBox(height: 20),
            TextField(
              controller: latController,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: 'Latitude',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: lngController,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: 'Longitude',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                final lat = latController.text.trim();
                final lng = lngController.text.trim();
                final qrData = "geo:$lat,$lng"; // QR format for location
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
