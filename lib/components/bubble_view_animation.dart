
import 'dart:math';

import 'package:flutter/material.dart';


class BubbleViewAnimation extends StatefulWidget {
  const BubbleViewAnimation({super.key});

  @override
  State<BubbleViewAnimation> createState() => _BubbleViewAnimationState();
}

class _BubbleViewAnimationState extends State<BubbleViewAnimation> with
    TickerProviderStateMixin {

  int randomCircle = Random().nextInt(7);
  bool isAnimating = false;

  double randomCoordinate(double containerSize){
    return Random().nextDouble()*containerSize;


  }

  double randomSize(){
    return Random().nextInt(77) + 4.0;
  }

  void startAnimating(){
    isAnimating = true;
    Future.delayed(const Duration(milliseconds: 2000),(){
      setState(() {
        isAnimating = false;
        startAnimating();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startAnimating();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: Stack(
        children:
          List.generate(randomCircle, (index){
           return AnimatedPositioned(
             curve: Curves.easeInOut,
             left: isAnimating? randomCoordinate(MediaQuery.of(context).size.width * 0.8- randomSize()): 300/2,
             top: isAnimating? randomCoordinate(MediaQuery.of(context).size.width * 0.8- randomSize()): 300/2,
             duration: const Duration(minutes: 2000),
             child: AnimatedOpacity(opacity: isAnimating? 0.25:0.0,
              duration: const Duration(milliseconds: 2000),
               child: AnimatedContainer(duration: const Duration(milliseconds: 2000),
               width: isAnimating ? randomSize() : 0.0,
               height: isAnimating ? randomSize() : 0.0,
                 child: Container(
                   decoration: const BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.white,
                   ),
                 ),

               ),
            ),
           );
          }
          ),
      ),
    );
  }
}
