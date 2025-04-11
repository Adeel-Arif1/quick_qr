// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:quick_qr/pages/generate_qr/generate_code/buisness_page.dart' show BusinessPage;
import 'package:quick_qr/pages/generate_qr/generate_code/contact_page.dart' show ContactPage;
import 'package:quick_qr/pages/generate_qr/generate_code/email_page.dart';
import 'package:quick_qr/pages/generate_qr/generate_code/event_page.dart';
import 'package:quick_qr/pages/generate_qr/generate_code/instagram_page.dart';
import 'package:quick_qr/pages/generate_qr/generate_code/locatation_page.dart';
import 'package:quick_qr/pages/generate_qr/generate_code/telephone_page.dart';
import 'package:quick_qr/pages/generate_qr/generate_code/twitter_page.dart';
import 'package:quick_qr/pages/generate_qr/generate_code/website_page.dart';
import 'package:quick_qr/pages/generate_qr/generate_code/whatsapp_page.dart';
import 'package:quick_qr/pages/home_page.dart';
import 'package:quick_qr/pages/splash_page.dart';

import 'pages/generate_qr/generate_code/text_page.dart';
import 'pages/generate_qr/generate_code/wifi_page.dart';
import 'pages/generate_qr/generate_qr.dart';
import 'pages/history_page.dart';
import 'pages/open_file_page.dart';
import 'pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
       //initialRoute: '/',
    routes: {
    //  '/': (context) => const GenerateQr(),
    '/settings': (context) => SettingsPage(),
      '/history': (context) => HistoryPage(),
     '/generateqr': (context) => GenerateQr(),
    '/qrscanner': (context) => QRScannerPage(),
      '/text': (context) => TextPage(),
      '/website': (context) => WebsitePage(),
      '/wifi': (context) => WifiQRPage(),
      '/event': (context) => EventPage(),
      '/contact': (context) => ContactPage(),
      '/business': (context) => BusinessPage(),
      '/location': (context) => LocationPage(),
      '/whatsapp': (context) => WhatsappPage(),
      '/email': (context) => EmailPage(),
      '/twitter': (context) => TwitterPage(),
      '/instagram': (context) => InstagramPage(),
      '/telephone': (context) => TelephonePage(),
    },
      home: SplashPage()
    );
  }
}
