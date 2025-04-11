// utils/qr_formatters.dart
class QRFormatters {
  // WiFi QR format: WIFI:S:<SSID>;T:<WPA|WEP|>;P:<password>;;
  static String formatWifiQR({required String ssid, required String password, String encryption = 'WPA'}) {
    return 'WIFI:S:$ssid;T:$encryption;P:$password;;';
  }

  // Twitter profile format: https://twitter.com/<username>
  static String formatTwitterProfile(String username) {
    return 'https://twitter.com/$username';
  }

  // Facebook profile format: https://facebook.com/<username>
  static String formatFacebookProfile(String username) {
    return 'https://facebook.com/$username';
  }

  // URL format
  static String formatURL(String url) {
    if (!url.startsWith('http')) {
      return 'https://$url';
    }
    return url;
  }

  // Plain text format
  static String formatPlainText(String text) {
    return text;
  }
}