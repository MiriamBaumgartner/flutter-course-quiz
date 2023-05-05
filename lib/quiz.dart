import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/questions.dart';
import 'start_screen.dart';
import 'questions_screen.dart';
import 'package:flutter_application_1/models/quiz_question.dart';
import 'result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
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

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if ('question-screen' == activeScreen) {
      screenWidget =
          QuestionScreen(onSelectAnswer: (answer) => chooseAnswers(answer));
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        switchScreen,
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 169, 117, 232),
                Color.fromARGB(255, 158, 232, 223),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}


  //  return MaterialApp(
  //     theme: ThemeData(
  //       scaffoldBackgroundColor: Colors.purple[900],
  //     ),
  //     home: Scaffold(
  //       body: Center(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Image.asset(
  //               'assets/images/quiz-logo.png',
  //               width: 300,
  //               height: 300,
  //               color: Colors.white38,
  //             ),
  //             const Padding(
  //               padding: EdgeInsets.only(
  //                 top: 80,
  //                 bottom: 80,
  //               ),
  //               child: Text(
  //                 'Learn Flutter the fun way!',
  //                 style: TextStyle(color: Colors.white, fontSize: 25),
  //               ),
  //             ),
  //             ElevatedButton.icon(
  //               icon: const Icon(Icons.arrow_circle_right),
  //               label: const Text('Start Quiz'),
  //               onPressed: () {},
  //               style: ElevatedButton.styleFrom(
  //                 backgroundColor: Colors.purple[900],
  //               ),
  //             ),
  //           ],
  //           child: QuestionScreen(),
  //         ),
  //       ),
  //     ),
  //   );