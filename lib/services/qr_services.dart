// services/qr_service.dart
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:image/image.dart' as img;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class QRService {
  // Generate QR widget for display
  static QrImageView generateQRWidget(String data, {double size = 200}) {
    return QrImageView(
      data: data,
      version: QrVersions.auto,
      size: size,
      backgroundColor: Colors.white,
    );
  }

  // Save QR code to device
  static Future<String?> saveQRCode(GlobalKey globalKey) async {
    try {
      final imageBytes = await _captureQrImage(globalKey);
      if (imageBytes != null) {
        final directory = await getApplicationDocumentsDirectory();
        final path = '${directory.path}/qr_${DateTime.now().millisecondsSinceEpoch}.png';
        final image = img.decodeImage(imageBytes)!;
        final file = File(path);
        await file.writeAsBytes(img.encodePng(image));
        return path;
      }
    } catch (e) {
      print('Error saving QR: $e');
    }
    return null;
  }

  static Future<Uint8List?> _captureQrImage(GlobalKey key) async {
    try {
      final boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (e) {
      print('Error capturing QR: $e');
      return null;
    }
  }
}