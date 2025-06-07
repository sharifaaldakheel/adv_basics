import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key,
  required this.chosenAnswers,
  required this.onRestart});

  final List<String> chosenAnswers;
    final void Function() onRestart;


  List<Map<String, Object>> getScore() {
    final List<Map<String, Object>> score = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      score.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return score;
  }



  @override
  Widget build(context) {
    final summaryData = getScore();
    final totalQuestions = questions.length;

    final correctAnswers =
        summaryData.where((data) {
          return data['user_answer'] == data['correct_answer'];
        }).length;
    //where: filter the list based on a condition

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),

            Text(
              'You got $correctAnswers out of $totalQuestions right!',
              textAlign: TextAlign.center,
              style: GoogleFonts.tajawal(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color:Color.fromARGB(255, 36, 98, 148),
              ),
            ),
                                                SizedBox(height:20),

            QuestionsSummary(summaryData),
                                                SizedBox(height:40),

            ElevatedButton.icon(onPressed:onRestart,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 65, 164, 244),
              foregroundColor: const Color.fromARGB(255, 248, 249, 250),
              padding: const EdgeInsets.symmetric(horizontal: 40),
            ),
            icon:Icon(Icons.restart_alt_rounded),
            label: Text(
              'Retart Quiz',
              style: const TextStyle(fontSize: 20, fontFamily: 'Tajawal'),
              ),
            ),

          ],
        ),
      ),
    );
  }
}