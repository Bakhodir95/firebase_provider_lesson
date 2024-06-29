import 'package:firebase_provider/controllers/quiz_controller.dart';
import 'package:firebase_provider/models/quiz.dart';
import 'package:firebase_provider/views/widgets/first_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Widget> pages = [];
  int _curPage = 0;
  final Map<int, bool> _answeredQuestion = {};
  final _pageController = PageController();

  void _onAnswerSelected(int pageIndex, bool isAnswered) {
    setState(() {
      _answeredQuestion[pageIndex] = isAnswered;
    });
  }

  void _nextPage() {
    if (_curPage < _answeredQuestion.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _curPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final quizController = context.read<QuizController>();
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
                : Center(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: questions.length,
                      onPageChanged: (index) {
                        _curPage = index;
                      },
                      itemBuilder: (BuildContext context, int index) {
                        final question = Quiz.fromJson(questions[index]);
                        return AlternativesWidget(
                          question: question,
                        );
                      },
                    ),
                  );
          }),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _answeredQuestion[_curPage] == true ? _nextPage : null;
          },
          label: const Text('Next')),
    );
  }
}
