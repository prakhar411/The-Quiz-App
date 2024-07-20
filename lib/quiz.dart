import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/gradient_container.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activescreen;
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   activescreen = FrontPage(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      // activescreen = const QuestionsScreen();
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = FrontPage(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(chooseAnswers);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 183, 142, 255),
            Color.fromARGB(255, 145, 90, 241),
            Color.fromARGB(255, 91, 64, 248),
            Color.fromARGB(255, 42, 11, 196)
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: screenWidget,
      ),
    ));
  }
}
