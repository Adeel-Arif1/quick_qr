import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quick_qr/widgets/bottom_navigation_bar.dart';
import '../widgets/top_bar.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  late MobileScannerController _scannerController;
  final ImagePicker _picker = ImagePicker();
  String? _lastScannedCode;
  bool _isTorchOn = false;
  bool _hasCameraPermission = false;
  bool _isScannerReady = false;
    //bool _isScannerReady = false;
  bool _isManualCapture = false;  // Add this line to define the variable

  @override
  void initState() {

    void _handleManualCapture() async {
    setState(() => _isManualCapture = true);
    try {
      // Correct approach for manual capture with MobileScanner
      await _scannerController.start();  // Start scanning first
    } catch (e) {
      _showSnackbar('Error capturing QR code: ${e.toString()}');
    } finally {
      setState(() => _isManualCapture = false);
    }
  }
    super.initState();
    _scannerController = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
    );
    _checkCameraPermission();
  }

  Future<void> _checkCameraPermission() async {
    final status = await Permission.camera.status;
    if (status.isGranted) {
      _startScanner();
    } else {
      _requestCameraPermission();
    }
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    setState(() {
      _hasCameraPermission = status.isGranted;
      if (_hasCameraPermission) {
        _startScanner();
      } else {
        _showSnackbar('Camera permission is required to scan QR codes');
      }
    });
  }
void _handleManualCapture() async {
  setState(() => _isManualCapture = true);
  try {
    // Correct approach for manual capture with MobileScanner
    await _scannerController.start();  // Start scanning first
  } catch (e) {
    _showSnackbar('Error capturing QR code: ${e.toString()}');
  } finally {
    setState(() => _isManualCapture = false);
  }
}



  void _startScanner() {
    if (_hasCameraPermission && !_isScannerReady) {
      setState(() {
        _isScannerReady = true;
      });
      _scannerController.start();
    }
  }

  Future<void> _openGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final BarcodeCapture? barcodeCapture = await _scannerController.analyzeImage(image.path);

      // Check if the result is not null
      if (barcodeCapture != null) {
        final List<Barcode> barcodes = barcodeCapture.barcodes;

        if (barcodes.isNotEmpty) {
          _handleScanResult(barcodes.first);
        } else {
          _showSnackbar('No QR code found in the image');
        }
      } else {
        _showSnackbar('Failed to analyze image');
      }
    } catch (e) {
      _showSnackbar('Error analyzing image: ${e.toString()}');
    }
  }

  void _onQRDetect(BarcodeCapture capture) {
    if (capture.barcodes.isEmpty) return;
    _handleScanResult(capture.barcodes.first);
  }

  void _handleScanResult(Barcode barcode) {
    final String? result = barcode.rawValue ?? barcode.displayValue;
    if (result == null || result == _lastScannedCode) return;

    _lastScannedCode = result;
    _showQRResult(result);
  }

  void _showQRResult(String result) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1C1C1C),
        title: const Text('Scan Result', style: TextStyle(color: Colors.white)),
        content: Text(result, style: const TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _scannerController.start();
            },
            child: const Text('OK', style: TextStyle(color: Color(0xFFFDB623))),
          ),
        ],
      ),
    );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFFFDB623),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Widget _buildPermissionMessage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.camera_alt, size: 64, color: Colors.white70),
          const SizedBox(height: 20),
          const Text(
            'Camera permission required',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFDB623),
            ),
            onPressed: _requestCameraPermission,
            child: const Text(
              'Grant Permission',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      body: Stack(
        children: [
          // Camera Scanner or Permission Message
          if (_hasCameraPermission && _isScannerReady)
            GestureDetector(
              onTap: _handleManualCapture,
              onDoubleTap: _handleManualCapture,
              child: MobileScanner(
                controller: _scannerController,
                onDetect: _onQRDetect,
                fit: BoxFit.cover,
              ),
            )
          else if (!_hasCameraPermission)
            _buildPermissionMessage(),

          // Top Bar (only visible if we have permission)
          if (_hasCameraPermission)
            Align(
              alignment: Alignment.topCenter,
              child: TopBar(
                onGalleryPressed: _openGallery,
                onTorchPressed: () {
                  setState(() {
                    _isTorchOn = !_isTorchOn;
                    _scannerController.toggleTorch();
                  });
                },
                onCameraSwitchPressed: () {
                  _scannerController.switchCamera();
                },
              ),
            ),

          // QR Code Scanner Overlay (only visible if we have permission)
          if (_hasCameraPermission)
            Center(
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFFDB623), width: 4),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

          // Bottom Navigation Bar
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavBar(
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }
}

