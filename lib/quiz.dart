import 'package:flutter/material.dart';
import 'main_container.dart';
import 'questions_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'results_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
   List<String> selectedAnswer = [];

  var activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   super.initState();
  // }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        // selectedAnswer = [];
        activeScreen = 'results-screen';
      });
    }
  }

  //data activity replacing on the screen, MainContainer needs to acess the switchscreen method
  void switchScreen() {
    setState(() {
      activeScreen = activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
  setState(() {
    selectedAnswer = [];
    activeScreen = 'start-screen';
  });
}


  @override
  Widget build(context) {
    Widget screenWidget = MainContainer(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget =  QuestionsScreen(
        onSelectAnswer: chooseAnswer
        );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswer,
      onRestart: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
