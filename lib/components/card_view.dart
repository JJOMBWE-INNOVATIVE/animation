

import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';

import 'card_view_shadow.dart';
import 'custom_circle_view.dart';





class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  int imageNumber = 1;

  List<int> generatedNumber = [];

  void randomNumber() {
    if (generatedNumber.length == 5) {
      generatedNumber.clear();
    }
    int randomNumber;
    do {
      randomNumber = Random().nextInt(5) + 1;
    } while (generatedNumber.contains(randomNumber));
    generatedNumber.add(randomNumber);

    setState(() {
      imageNumber = randomNumber;
    });
  }


  List<String> animalDetails = [
    "Elephant: The majestic elephant, Earth's largest land animal.",
    "Lion: The lion, often called the 'king of the jungle.'",
    "Frog: Frogs are amphibians known for their unique lifecycle.",
    "Panda: The panda, with its distinctive black and white fur.",
    "Fish: Fish, the diverse aquatic creatures.",
  ];

  List<String> animals = [
    'Elephant',
    'Lion',
    'Panda',
    'Frog',
    'Fish'
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SizedBox(
            height: 800,
            width:570 ,
            child: Stack(
              children: [
                const CardViewShadow(),
                Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  gradient:  const LinearGradient(colors:[
                      Color(0xFF0052D4),
                    Color(0xFFADD8E6),
                    Color(0xFF0000FF),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,

                  )
                ),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      animals[imageNumber-1],
                      style: const TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        animalDetails[imageNumber-1],
                        style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Stack(
                      children: [
                      const CustomCircleView(),
                      Positioned.fill(
                          child:Image.asset('Assets/image-$imageNumber.png',
                            fit: BoxFit.contain,
                          ),
                      ),
                        ],
                    ),
                  ],
                ),
              ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            randomNumber();
                          },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 16.0),
                          elevation: 5,
                          backgroundColor: Colors.white,
                        ),
                          child: const Text('Explore More',style: TextStyle(fontWeight: FontWeight.bold,
                         fontSize: 18.0,
                          ),
                          ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}




