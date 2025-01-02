import 'package:flutter/material.dart';
import 'package:quiz_app/data/colors.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswer = [];

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questoins-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer.clear();
      activeScreen = 'questoins-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : QuestoinsScreen(
            onSelectAnswer: chooseAnswer,
          );

    screenWidget = activeScreen == 'results-screen'
        ? ResultsScreen(
            chosenAnswers: selectedAnswer,
            onRestart: restartQuiz,
          )
        : screenWidget;

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: secondary,
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
