import 'package:flutter/material.dart';
import 'package:quiz_app/data/colors.dart';
import 'package:quiz_app/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: primary, // Set the border color
            width: 1.0, // Set the border width
          ),
          borderRadius:
              BorderRadius.circular(10.0), // Optional: Add border radius
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: summaryData.map((data) {
              return SummaryItem(data);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
