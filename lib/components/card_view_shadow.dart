

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardViewShadow extends StatelessWidget {
  const CardViewShadow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40.0),
      boxShadow:  [
        BoxShadow(
          color: Colors.blue.shade900,
          offset: Offset(0,12),
        ),
        BoxShadow(
          color: Colors.blue.shade500,
          offset: Offset(0,3),
        ),
      ],
    ),
    );
  }
}