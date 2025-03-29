import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.txt});

  String txt ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
      ),
      width: double.infinity,
      height: 60,
      child: Center(
        child: Text(
          txt,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
