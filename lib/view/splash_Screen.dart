import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/home_screen/home_screen.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState(){
   Future.delayed(Duration(seconds: 3)).then((value) {

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
   });
   super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(body: SizedBox(
      child: Center(child: Image.asset("images/quiz.png"),
      
        
        ),
    ),
      
      
        
        );
    

    
  }
}