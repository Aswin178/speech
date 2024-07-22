import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech/const.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:avatar_glow/avatar_glow.dart';

class SpeechHome extends StatefulWidget {
  const SpeechHome({super.key});

  @override
  State<SpeechHome> createState() => _SpeechHomeState();
}

class _SpeechHomeState extends State<SpeechHome> {
  final SpeechToText _speechToText = SpeechToText();
  bool speecEnabled = false;
  bool listningstart = false;
  String _wordsspoken = "";
  double confidenceLevel = 0;

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    speecEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void startListening() async {
    await _speechToText.listen(onResult: onSpeechresult);
    setState(() {
      
      listningstart = true;
    });
  }

  void onSpeechresult(SpeechRecognitionResult result) {
    setState(() {
      _wordsspoken = result.recognizedWords;
      confidenceLevel = result.confidence;
    });
  }

  @override
  Widget build(BuildContext context) {
  //  Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
      duration: const Duration(milliseconds: 2000),
        animate: listningstart,
        repeat: true,
        glowColor: primaryclr,
        child: FloatingActionButton(
          onPressed: () {
            _speechToText.isListening ? stopListening() : startListening();
          },
          child: Icon(
            Icons.mic,
            color: Colors.white,
          ),
          backgroundColor: primaryclr,
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: Image.asset(
                  "assets/bg.png",
                  opacity: const AlwaysStoppedAnimation(.98),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  top: 100,
                  left: 15,
                  child: Text(
                    _speechToText.isListening
                        ? "Listening..."
                        : speecEnabled
                            ? "Tap mic button to record"
                            : "Enable permission",
                    style: GoogleFonts.rubik(
                        color:const Color(0xffBFC9CA), fontSize: 22),
                  )),
              Positioned(
                  top: 200,
                  left: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                  
                    child: SingleChildScrollView(
                      child: 
                        Text(
                          _wordsspoken,
                          style:
                              GoogleFonts.ptSans(color: Colors.white, fontSize: 40),
                        ),
                      
                    ),
                  ))
            ],
          )),
    );
  }

  stopListening() async {
    await _speechToText.stop();
    setState(() {
      listningstart = false;
    });
  }
}
