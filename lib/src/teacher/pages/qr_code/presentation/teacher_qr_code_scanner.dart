import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class TeacherQRCodeScanner extends StatefulWidget {
  static const String routeName = 'teacher/qr-code-scanner';

  const TeacherQRCodeScanner({super.key});

  @override
  State<TeacherQRCodeScanner> createState() => _TeacherQRCodeScannerState();
}

class _TeacherQRCodeScannerState extends State<TeacherQRCodeScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.78,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
          ),
        ),
        // Expanded(
        //   child: Center(
        //     child: (result != null)
        //         ? Text(
        //             'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
        //         : const Text('Scan a code'),
        //   ),
        // )
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }
}
