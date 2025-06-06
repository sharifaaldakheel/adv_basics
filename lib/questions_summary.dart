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
          children:
              summaryData.map((data) {
                final isCorrect = data['user_answer'] == data['correct_answer'];

                return Padding(
                  padding: const EdgeInsets.all(6.0),

                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color:
                            isCorrect
                                ? const Color.fromARGB(255, 139, 196, 141)
                                : const Color.fromARGB(255, 195, 136, 131),
                        width: 1.5,
                      ),
                                  boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              )
            ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 219, 196, 21),
                          ),
                          child: Text(
                            ((data['question_index'] as int) + 1).toString(),
                            style: GoogleFonts.tajawal(
                              color: Colors.white,
                              height: 2.5,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // expanded allow its child to take all the available space
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                data['question'] as String,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 5),

                              Text('Selected answer: ${data['user_answer']}'),
                              Text('Correct answer: ${data['correct_answer']}'),
                            ],
                          ),
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
