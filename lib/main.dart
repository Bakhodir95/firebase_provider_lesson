import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_provider/controllers/products_controller.dart';
import 'package:firebase_provider/firebase_options.dart';
import 'package:firebase_provider/views/screens/home_screen.dart';
import 'package:firebase_provider/views/screens/products_screen.dart';
import 'package:firebase_provider/views/screens/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) {
      return ProductsController();
    }, builder: (context, child) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: QuizScreen(),
      );
    });
  }
}
