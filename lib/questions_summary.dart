import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 650,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final isCorrect = data['user_answer'] == data['correct_answer'];

            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isCorrect
                        ? const Color.fromARGB(255, 139, 196, 141)
                        : const Color.fromARGB(255, 195, 136, 131),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                                                  color: const Color.fromARGB(255, 231, 231, 231),

                        
                      ),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: GoogleFonts.tajawal(
                          color: const Color.fromARGB(255, 135, 134, 134),
                          height: 2.2,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      data['question'] as String,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.tajawal(
                        color: const Color.fromARGB(255, 35, 98, 150),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Selected answer: ',
                            style: GoogleFonts.tajawal(
                              fontWeight: FontWeight.bold,
                    color: isCorrect
                        ? const Color.fromARGB(255, 19, 104, 21)
                        : const Color.fromARGB(255, 130, 36, 28),                            ),
                          ),
                          TextSpan(
                            text: '${data['user_answer']}',
                            style: GoogleFonts.tajawal(
                              fontWeight: FontWeight.normal,
                    color: isCorrect
                        ? const Color.fromARGB(255, 19, 104, 21)
                        : const Color.fromARGB(255, 130, 36, 28),                              ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Correct answer: ',
                            style: GoogleFonts.tajawal(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 19, 104, 21)
                            ),
                          ),
                          TextSpan(
                            text: '${data['correct_answer']}',
                            style: GoogleFonts.tajawal(
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 19, 104, 21)
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
