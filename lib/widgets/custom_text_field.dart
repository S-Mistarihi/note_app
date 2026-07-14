import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/core/constants/app_text_style.dart';

class CustomTextField {
  CustomTextField._local();

  static final CustomTextField _shared = CustomTextField._local();

  factory CustomTextField() => _shared;

  Widget buildTextFormField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hintText,
    required TextInputAction textInputAction,
    required int maxLines,
    required List<TextInputFormatter> inputFormatters,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: TextInputType.text,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.font24WhiteNormal,
        border: _buildOutlineInputBorder(),
        enabledBorder: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white, width: 1.5),
    );
  }
}
