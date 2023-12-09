import 'package:flutter/material.dart';

import 'package:fun_chat/src/chat/presentation/widgets/receivedMessages.dart';
import 'package:fun_chat/src/chat/presentation/widgets/sentMessages.dart';

class IndiMsg extends StatefulWidget {
  const IndiMsg(
      {required this.message,
      required this.date,
      required this.sent, super.key});
  final String message;
  final DateTime date;
  final bool sent;

  @override
  State<IndiMsg> createState() => _IndiMsgState();
}

class _IndiMsgState extends State<IndiMsg> {
  @override
  Widget build(BuildContext context) {
    return widget.sent
        ? SentMessage(message: widget.message, date: widget.date)
        : ReceievedMessage(message: widget.message, date: widget.date);
  }
}
