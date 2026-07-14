import 'package:flutter/material.dart';

import '../core/constants/app_text_style.dart';

class DateFormatter extends StatelessWidget {
  final DateTime dateTime;

  const DateFormatter({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        children: [
          Text(
            '${dateTime.day}/${dateTime.month}/${dateTime.year}',
            style: AppTextStyle.font18BlackNormal,
          ),
          Text(
            '${dateTime.hour}:${dateTime.minute}',
            style: AppTextStyle.font18BlackNormal,
          ),
        ],
      ),
    );
  }
}
