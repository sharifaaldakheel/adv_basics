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
                    const SizedBox(height: 40),

          Text(
            'Start Learning Flutter',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 50, 133, 201),
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
              backgroundColor: Color.fromARGB(255, 65, 164, 244),
              foregroundColor: Color.fromARGB(255, 248, 249, 250),
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
