import 'package:flutter/material.dart';
import 'package:fun_chat/core/constants/colors.dart';
import 'package:fun_chat/core/extensions/context_extensions.dart';
import 'package:fun_chat/core/widgets/Gaps.dart';
import 'package:intl/intl.dart';

class SentMessage extends StatefulWidget {
  const SentMessage({
    required this.message,
    required this.date,
    super.key,
  });
  final String message;
  final DateTime date;

  @override
  State<SentMessage> createState() => _SentMessageState();
}

class _SentMessageState extends State<SentMessage> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        constraints: BoxConstraints(maxWidth: context.width / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: KColors.primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(14))
                    .copyWith(topRight: const Radius.circular(0)),
              ),
              child: Text(
                widget.message,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const VerticalGap(height: 10),
            Text(DateFormat.Hm().format(widget.date))
          ],
        ),
      ),
    );
  }
}
