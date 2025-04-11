import 'package:flutter/material.dart';
import 'package:quick_qr/constants.dart';
import 'package:quick_qr/pages/qr_display_page.dart';
import 'package:quick_qr/widgets/custom_appbar.dart';

class BusinessPage extends StatelessWidget {
  BusinessPage({Key? key}) : super(key: key);

  final TextEditingController companyController = TextEditingController();
  final TextEditingController industryController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarydarkBlack,
      appBar: const CustomAppBar(
        title: 'Business',
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
                const Icon(Icons.business, size: 60, color: Colors.amber),
                const SizedBox(height: 20),
                buildInputField(companyController, 'Company Name'),
                buildInputField(industryController, 'Industry'),
                Row(
                  children: [
                    Expanded(child: buildInputField(phoneController, 'Phone')),
                    const SizedBox(width: 10),
                    Expanded(child: buildInputField(emailController, 'Email')),
                  ],
                ),
                buildInputField(websiteController, 'Website'),
                buildInputField(addressController, 'Address'),
                Row(
                  children: [
                    Expanded(child: buildInputField(cityController, 'City')),
                    const SizedBox(width: 10),
                    Expanded(
                        child: buildInputField(countryController, 'Country')),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    final combinedData = '''
Company: ${companyController.text}
Industry: ${industryController.text}
Phone: ${phoneController.text}
Email: ${emailController.text}
Website: ${websiteController.text}
Address: ${addressController.text}, ${cityController.text}, ${countryController.text}
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  icon: const Icon(Icons.qr_code, color: Colors.black),
                  label: const Text('Generate QR Code',
                      style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputField(TextEditingController controller, String hint,
      {int maxLines = 1}) {
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
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
