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
        margin: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You got $correctAnswers out of $totalQuestions right!',
              maxLines: 3,
              textAlign: TextAlign.center,
              style: GoogleFonts.tajawal(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 40),
            QuestionsSummary(summaryData),
            ElevatedButton(onPressed:onRestart,
            child: Text('Restart Quiz')),
          ],
        ),
      ),
    );
  }
}
