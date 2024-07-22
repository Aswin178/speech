import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech/const.dart';
import 'package:speech/screens/home.dart';

class SpeechLanding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff03031d),
      body: Stack(
        children: [
          Positioned(
              top: 5,
              child: Image.asset("assets/bg.png"
                  ,
                  opacity:const AlwaysStoppedAnimation(.5))),
          Positioned(
              top: 100,
              left: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Voice \nRecognition",
                    style:
                        GoogleFonts.roboto(color: Colors.white, fontSize: 40),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text("Save Time With Our Speech \nTranscription.",
                      style: GoogleFonts.roboto(
                          color: Color(0xffBFC9CA), fontSize: 22))
                ],
              )),
          Positioned(
              bottom: 60,
              child: GestureDetector(
                onTap: () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const SpeechHome())),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: width / 6),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Get Started",
                        style:
                            GoogleFonts.roboto(color: primaryclr, fontSize: 25),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: primaryclr,
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
