import 'package:firebase_provider/controllers/quiz_controller.dart';
import 'package:firebase_provider/models/quiz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  final _variantController = TextEditingController();
  Widget build(BuildContext context) {
    final quizController = context.watch<QuizController>();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 22, 237),
      body: StreamBuilder(
          stream: quizController.list,
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data == null) {
              return const Center(
                child: Text(" No questions yet!"),
              );
            }
            final questions = snapshot.data!.docs;
            return questions.isEmpty
                ? const Center(
                    child: Text(" No questions yet!"),
                  )
                : ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (ctx, index) {
                      final question = Quiz.fromJson(questions[index]);
                      return ListTile(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  title: const Text("Edit"),
                                  content: TextField(
                                    controller: _variantController,
                                  ),
                                );
                              });
                        },
                      );
                    });
          }),
    );
  }
}
