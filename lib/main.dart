import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_provider/controllers/quiz_controller.dart';
import 'package:firebase_provider/firebase_options.dart';
import 'package:firebase_provider/views/screens/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) {
      return QuizController();
    }, builder: (context, child) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: QuizScreen(),
      );
    });
  }
}
