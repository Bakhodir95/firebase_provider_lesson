import 'package:firebase_provider/models/quiz.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AlternativesWidget extends StatefulWidget {
  Quiz question;
  AlternativesWidget({super.key, required this.question});

  @override
  State<AlternativesWidget> createState() => _AlternativesWidgetState();
}

class _AlternativesWidgetState extends State<AlternativesWidget> {
  List<bool> useranswer = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.question.question,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            wordSpacing: 2,
            letterSpacing: 2,
          ),
        ),
        for (int i = 0; i < 4; i++)
          Column(
            children: [
              CheckboxListTile(
                value: useranswer[i],
                onChanged: (value) {
                  setState(() {
                    useranswer[i] = value!;
                  });
                },
                title: Text(widget.question.variant[i]),
              ),
              const Gap(10),
            ],
          ),
      ],
    );
  }
}
