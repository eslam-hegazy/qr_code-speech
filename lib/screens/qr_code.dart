import 'package:flutter/material.dart';

import 'package:qr_code/screens/create_qrcode.dart';
import 'package:qr_code/screens/read_qrcode.dart';
import 'package:qr_code/screens/speech_screen.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({Key? key}) : super(key: key);

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  int index = 0;
  List screens = [
    CreateQRCode(),
    ReadQRCode(),
    SpeechScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        backgroundColor: const Color(0xFF313131),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.qr_code,
              ),
              label: "Create QR Code"),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner), label: "Scan QR Code"),
          BottomNavigationBarItem(icon: Icon(Icons.mic), label: "Speech"),
        ],
        currentIndex: index,
        onTap: ((value) {
          setState(() {
            index = value;
          });
        }),
      ),
      appBar: AppBar(
        title: const Text("Log App"),
        backgroundColor: Colors.black.withOpacity(0.8),
        elevation: 1,
      ),
      body: screens[index],
    );
  }
}
