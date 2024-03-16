import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home_screen_controller.dart';
import 'package:flutter_application_1/view/persontage_screen/persontage_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentquestionindex = 0;
  int? selectedAnswerIndex;
  int rightAnsCount=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 108, 104, 104)),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Text(
                  HomeScreenController
                      .questionsData[currentquestionindex].question,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: List.generate(
                4,
                (index) => InkWell(
                      onTap: () {
                        if (selectedAnswerIndex == null) {
                          selectedAnswerIndex = index;

                          if(selectedAnswerIndex==HomeScreenController.questionsData[currentquestionindex].correctAnsInd){
                            rightAnsCount++;
                          }

                          print(rightAnsCount);
                          setState(() {});
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: (index ==
                                              HomeScreenController
                                                  .questionsData[
                                                      currentquestionindex]
                                                  .correctAnsInd &&
                                          selectedAnswerIndex != null)
                                      ? Colors.green
                                      : selectedAnswerIndex == index
                                          ? selectedAnswerIndex ==
                                                  HomeScreenController
                                                      .questionsData[
                                                          currentquestionindex]
                                                      .correctAnsInd
                                              ? Colors.green
                                              : Colors.red
                                          : Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  HomeScreenController
                                      .questionsData[currentquestionindex]
                                      .questionsList[index],
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  buildIcons(index),
                                  color: buildColor(index),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: InkWell(
              onTap: () {
                if (currentquestionindex <
                    HomeScreenController.questionsData.length - 1) {
                  currentquestionindex++;
                  selectedAnswerIndex = null;
                  setState(() {});
                }
                else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersontageScreen(
                            righAnswerCount: rightAnsCount,
                          ),
                        ));
                  }
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }

  Color buildColor(int index) {
    if (index ==
            HomeScreenController
                .questionsData[currentquestionindex].correctAnsInd &&
        selectedAnswerIndex != null) {
      return Colors.green;
    } else if (selectedAnswerIndex == index) {
      if (selectedAnswerIndex ==
          HomeScreenController
              .questionsData[currentquestionindex].correctAnsInd) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    } else {
      return Colors.grey;
    }
  }


  IconData?  buildIcons(int index){
    if (index ==
            HomeScreenController
                .questionsData[currentquestionindex].correctAnsInd &&
        selectedAnswerIndex != null) {
          return Icons.done;
        }
        else if(selectedAnswerIndex == index){
           if (selectedAnswerIndex !=
          HomeScreenController
              .questionsData[currentquestionindex].correctAnsInd){
                return Icons.close;
              }


        }else{
          return null;
        }
  }
}
