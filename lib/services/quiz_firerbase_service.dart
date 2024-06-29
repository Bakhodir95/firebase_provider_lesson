import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_provider/models/quiz.dart';

class QuizFirerbaseService {
  final _questionCollection = FirebaseFirestore.instance.collection('quizzes');

  Stream<QuerySnapshot> getQuestions() async* {
    yield* _questionCollection.snapshots();
  }

  void addQuestion(Quiz quiz) {
    _questionCollection.add({
      "question": quiz.question,
      "answer": quiz.answer,
      "variant": quiz.variant
    });
  }

  void edidQuestion(Quiz quiz) {
    _questionCollection.doc(quiz.id).update({
      "question": quiz.question,
      "answer": quiz.answer,
      "variant": quiz.variant
    });
  }

  void deleteQuestion(Quiz quiz) {
    _questionCollection.doc(quiz.id).delete();
  }
}
