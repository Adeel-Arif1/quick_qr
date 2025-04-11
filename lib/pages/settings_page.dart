import 'package:flutter/material.dart';
import 'package:quick_qr/constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isVibrateOn = true;
  bool _isBeepOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarydarkBlack, // Dark background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back icon with spacing
            Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: secondaryColor,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(height: 16),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Settings",
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Vibrate Toggle
            ReusableRowWidget(
              icon: Icons.vibration,
              title: "Vibrate",
              subtitle: "Vibration when scan is done.",
              switchValue: _isVibrateOn,
              onSwitchChanged: (value) {
                setState(() {
                  _isVibrateOn = value;
                });
                print("Vibrate toggled: $value");
              },
            ),
            const SizedBox(height: 16),

            // Beep Toggle
            ReusableRowWidget(
              icon: Icons.volume_up,
              title: "Beep",
              subtitle: "Beep when scan is done.",
              switchValue: _isBeepOn,
              onSwitchChanged: (value) {
                setState(() {
                  _isBeepOn = value;
                });
                print("Beep toggled: $value");
              },
            ),
            const SizedBox(height: 32),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Support",
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            ReusableRowWidget(
              icon: Icons.star,
              title: "Rate Us",
              subtitle: "Your best reward to us.",
              showSwitch: false,
            ),
            const SizedBox(height: 16),

            ReusableRowWidget(
              icon: Icons.privacy_tip,
              title: "Privacy Policy",
              subtitle: "Follow our policies that benefit you.",
              showSwitch: false,
            ),
            const SizedBox(height: 16),

            ReusableRowWidget(
              icon: Icons.share,
              title: "Share",
              subtitle: "Share app with others.",
              showSwitch: false,
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableRowWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool showSwitch;
  final bool switchValue;
  final ValueChanged<bool>? onSwitchChanged;

  const ReusableRowWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.showSwitch = true,
    this.switchValue = false,
    this.onSwitchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(8),
        border: Border(
          bottom: BorderSide(color: secondaryColor, width: 2),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white, size: 30),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (showSwitch)
            Switch(
              value: switchValue,
              onChanged: onSwitchChanged,
              activeColor: secondaryColor,
            ),
        ],
      ),
    );
  }
}
