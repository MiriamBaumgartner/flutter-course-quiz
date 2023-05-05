import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              final bool hasCorrectAnswer =
                  data['user_answer'] == data['correct_answer'];

              Color color;

              if (hasCorrectAnswer) {
                color = Color.fromARGB(255, 155, 109, 216);
              } else {
                color = Color.fromARGB(255, 205, 89, 163);
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['user_answer'] as String,
                            style: TextStyle(color: color)),
                        Text(data['correct_answer'] as String,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 101, 33, 114))),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
