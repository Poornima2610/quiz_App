import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home_screen_controller.dart';


class PersontageScreen extends StatelessWidget {
  const PersontageScreen({super.key, required this.righAnswerCount});
  final int righAnswerCount;

  @override
  Widget build(BuildContext context) {
    final percentage =
        (righAnswerCount / HomeScreenController.questionsData.length) * 100;
    return Scaffold(
      body: Center(
        child: Text("Your score is ${percentage.round()} % "),
      ),
    );
  }
}