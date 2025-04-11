import 'package:flutter/material.dart';
import 'package:quick_qr/constants.dart';
import 'package:quick_qr/pages/qr_display_page.dart';
import 'package:quick_qr/widgets/custom_appbar.dart';

class EventPage extends StatelessWidget {
  EventPage({Key? key}) : super(key: key);

  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController startDateTimeController = TextEditingController();
  final TextEditingController endDateTimeController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarydarkBlack,
      appBar: CustomAppBar(
            title: 'Event'
          ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Icon(Icons.event, size: 60, color: Colors.amber),
                const SizedBox(height: 20),
                buildInputField(eventNameController, 'Event Name'),
                buildInputField(startDateTimeController, 'Start Date and Time (e.g. 12 Dec 2024, 10:00 PM)'),
                buildInputField(endDateTimeController, 'End Date and Time (e.g. 12 Dec 2024, 11:00 PM)'),
                buildInputField(locationController, 'Event Location'),
                buildInputField(descriptionController, 'Description', maxLines: 3),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    final combinedData = '''
Event: ${eventNameController.text}
Start: ${startDateTimeController.text}
End: ${endDateTimeController.text}
Location: ${locationController.text}
Details: ${descriptionController.text}
''';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QRDisplayPage(qrData: combinedData),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  icon: const Icon(Icons.qr_code, color: Colors.black),
                  label: const Text('Generate QR Code', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputField(TextEditingController controller, String hint, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white54),
          filled: true,
          fillColor: Colors.grey[800],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
