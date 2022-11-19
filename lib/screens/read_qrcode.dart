import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code/widget/copy_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReadQRCode extends StatefulWidget {
  const ReadQRCode({Key? key}) : super(key: key);

  @override
  State<ReadQRCode> createState() => _ReadQRCodeState();
}

class _ReadQRCodeState extends State<ReadQRCode> {
  String str = "Let's Scan It !!";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF313131),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(2.h),
              child: CopyableText(
                data: str,
                style: GoogleFonts.cairo(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            MaterialButton(
              onPressed: scanQr,
              color: Colors.black.withOpacity(0.2),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.h),
              ),
              child: Text("Scan QR Code",
                  style: GoogleFonts.acme(
                    color: Colors.white,
                    fontSize: 20.sp,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode(
              "#2A99CF", "cancel", true, ScanMode.DEFAULT)
          .then((value) {
        setState(() {
          str = value;
        });
      });
    } catch (e) {
      setState(() {
        str = "Unable to Read This";
      });
    }
  }
}
