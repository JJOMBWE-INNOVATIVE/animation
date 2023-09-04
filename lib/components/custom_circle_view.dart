


import 'package:flutter/material.dart';

import 'bubble_view_animation.dart';

class CustomCircleView extends StatefulWidget {
  const CustomCircleView({
    super.key,
  });

  @override
  State<CustomCircleView> createState() => _CustomCircleViewState();
}

class _CustomCircleViewState extends State<CustomCircleView> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  bool _isAnimatedGradient = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 1)
    )..addListener(() {
      setState(() {
       _isAnimatedGradient = _animationController.value<0.5;
      });
    });

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context,child){
                return DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: [Colors.blue.shade500,
                            Colors.purple.shade300,
                            Colors.white,
                          ],
                        begin: _isAnimatedGradient? Alignment.topLeft
                            :Alignment.bottomLeft,
                        end: _isAnimatedGradient? Alignment.bottomRight
                            :Alignment.topRight,
                      ),
                    ),
                );
              },
            ),
          ),
          const BubbleViewAnimation(),
        ],
      ),
    );
  }
}