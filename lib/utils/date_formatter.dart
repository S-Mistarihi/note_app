import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/l10n/app_locale.dart';

import '../core/constants/app_text_style.dart';

class DateFormatter extends StatelessWidget {
  final DateTime dateTime;

  const DateFormatter({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {

    final formattedDate = DateFormat(
      'dd/MM/yyyy',
      AppLocale().locale.languageCode,
    ).format(dateTime);

    final formattedTime = DateFormat.jm(
      AppLocale().locale.languageCode,
    ).format(dateTime);

    return Align(
      alignment: AppLocale().isArabic()
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Column(
        children: [
          Text(formattedDate, style: AppTextStyle.font18BlackNormal),
          Text(formattedTime, style: AppTextStyle.font18BlackNormal),

        ],
      ),
    );
  }
}
