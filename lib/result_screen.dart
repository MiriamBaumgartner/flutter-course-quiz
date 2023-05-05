import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
    this.switchScreen, {
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;
  final void Function() switchScreen;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.abel(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              icon: const Icon(Icons.restart_alt),
              onPressed: switchScreen,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              label: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
