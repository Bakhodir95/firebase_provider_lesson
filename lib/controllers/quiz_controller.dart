import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_provider/models/quiz.dart';
import 'package:firebase_provider/services/quiz_firerbase_service.dart';
import 'package:flutter/foundation.dart';

class QuizController extends ChangeNotifier {
  final _questionFirebaseService = QuizFirerbaseService();

  Stream<QuerySnapshot> get list {
    return _questionFirebaseService.getQuestions();
  }

  void addQuestion(Quiz quiz) {
    _questionFirebaseService.addQuestion(quiz);
  }

  void editQuestion(String id, String title) {
    // _questionFirebaseService.edidQuestion(id, title);
  }

  void deleteQuestion() {
    // _questionFirebaseService.deleteQuestion()
  }
}
