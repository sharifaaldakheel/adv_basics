import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerBtn extends StatelessWidget {
  const AnswerBtn({super.key, required this.answerText, required this.onTap});

  final String answerText;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(

      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 20, 73, 117),
        padding: const EdgeInsets.symmetric(vertical: 16),
        
      ),

      child: Text(answerText,
      textAlign: TextAlign.center,
      style: GoogleFonts.tajawal(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color:  Color.fromARGB(255, 248, 249, 250),
      ),
      ),
    );
  }
}
