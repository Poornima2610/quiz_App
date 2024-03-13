import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentquestionindex = 0;
  int? selectedAnswerIndex;
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
                        if(selectedAnswerIndex==null){
                          selectedAnswerIndex=index;
                          print(selectedAnswerIndex);
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
                                  color: selectedAnswerIndex == index
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
                                  Icons.close,
                                  color: Colors.green,
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
                  setState(() {});
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
}
