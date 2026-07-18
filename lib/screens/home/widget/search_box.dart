import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_color.dart';
import '../../../generated/l10n.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const SearchBox({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,

      decoration: InputDecoration(
        hintText: S.of(context).searchBoxLabel,
        hintStyle: GoogleFonts.nunito(
          fontSize: 18,
          color: Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: Icon(Icons.search, color: AppColor.iconColor),
        suffixIcon: ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (context, value, child) {
            if (value.text.isEmpty) {
              return SizedBox();
            }

            return IconButton(
              onPressed: onClear,
              icon: Icon(Icons.close, color: AppColor.iconColor),
            );
          },
        ),
        border: _buildOutlineInputBorder(context),
        enabledBorder: _buildOutlineInputBorder(context),
        focusedBorder: _buildOutlineInputBorder(context),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(45),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onSurface,
        width: 1.5,
      ),
    );
  }
}
