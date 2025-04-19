import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

import '../constant/constants.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key , required this.message});

  final Message message ;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 20
        ),
        margin: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            color: kPrimaryColor
        ),
        child: Text(
          message.message,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }
}

class ChatBubbleAnother extends StatelessWidget {
  const ChatBubbleAnother({super.key , required this.message});

  final Message message ;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 20
        ),
        margin: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            ),
            color: Color(0xff017f9a),
        ),
        child: Text(
          message.message,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );
  }
}

