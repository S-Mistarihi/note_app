import 'package:flutter/material.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_text_style.dart';

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
        hintText: 'Search...',
        hintStyle: AppTextStyle.font18Bold,
        prefixIcon: Icon(Icons.search, color: AppColor.iconColor,),
        suffixIcon: ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (context, value, child) {
            if (value.text.isEmpty) {
              return SizedBox();
            }

            return IconButton(
              onPressed: onClear,
              icon: Icon(Icons.close, color: AppColor.iconColor,),
            );
          },
        ),
        border: _buildOutlineInputBorder(),
        enabledBorder: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(45),
      borderSide: BorderSide(color: Colors.white, width: 1.5),
    );
  }
}
