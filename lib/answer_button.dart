import 'package:flutter/material.dart';
import 'package:quiz_app/data/colors.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: secondary,
        foregroundColor: primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: const BorderSide(color: secondaryVariant, width: 1),
        ),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
