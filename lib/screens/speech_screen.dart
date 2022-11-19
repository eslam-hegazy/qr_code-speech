import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code/api/speech_api.dart';
import 'package:qr_code/widget/copy_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechScreen extends StatefulWidget {
  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  late stt.SpeechToText speech;
  String text = 'Press the button and start speaking';
  bool isListening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF313131),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        glowColor: Colors.red,
        endRadius: 90.0,
        duration: const Duration(milliseconds: 1000),
        repeat: true,
        showTwoGlows: true,
        animate: isListening,
        repeatPauseDuration: const Duration(milliseconds: 30),
        child: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: toggleRecording,
          child: Icon(isListening == true ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.h),
        child: SingleChildScrollView(
            child: Column(
          children: [
            CopyableText(
              data: text,
              style: GoogleFonts.cairo(color: Colors.white),
            ),
          ],
        )),
      ),
    );
  }

  Future toggleRecording() => SpeechApi.toggleRecording(
        onResult: (text) => setState(() => this.text = text),
        onListening: (isListening) {
          setState(() => this.isListening = isListening);
        },
      );
}
