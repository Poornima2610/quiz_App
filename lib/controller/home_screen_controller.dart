import 'package:flutter_application_1/model/quiz_screen_models/quizscreen_model.dart';

class HomeScreenController{
 static List<questionsModel> questionsData = [
    questionsModel(
      question: "What is the capital of France?",
      questionsList: ['Paris', 'London', 'Berlin', 'Madrid'],
      correctAnsInd: 0,
    ),
     questionsModel(
      question: "What is 7 + 3?",
      questionsList: ['10', '12', '15', '14'],
      correctAnsInd: 0,
    ),
     questionsModel(
      question: "What is the capital of France?",
      questionsList: ['Paris', 'London', 'Berlin', 'Madrid'],
      correctAnsInd: 0,
    ),
  ];
}