import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  const MainContainer(
    this.startQuiz,
    {
    super.key,
    this.color = const Color.fromARGB(255, 239, 231, 218),
  });

  final void Function() startQuiz;

  final Color color;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/question.png'),
          Text(
            'Start Learning Flutter',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 111, 90, 135),
              fontFamily: 'Tajawal',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              startQuiz();
              
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              backgroundColor: Color.fromARGB(255, 5, 115, 179),
              foregroundColor: Color.fromARGB(255, 238, 238, 238),
            ),
            icon:Icon(Icons.arrow_right_alt_rounded),
            label: Text(
              'Start Quiz',
              style: const TextStyle(fontSize: 20, fontFamily: 'Tajawal'),
            ),
          ),
        ],
      ),
    );
  }
}
