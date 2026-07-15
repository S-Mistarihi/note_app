import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField {
  CustomTextField._local();

  static final CustomTextField _shared = CustomTextField._local();

  factory CustomTextField() => _shared;

  Widget buildTextField({
    required BuildContext context,
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hintText,
    required TextInputAction textInputAction,
    required int maxLines,
    required List<TextInputFormatter> inputFormatters,
  }) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: TextInputType.text,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.nunito(
          fontSize: 24,
          color: Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.normal,
        ),
        border: _buildOutlineInputBorder(context),
        enabledBorder: _buildOutlineInputBorder(context),
        focusedBorder: _buildOutlineInputBorder(context),
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onSurface,
        width: 1.5,
      ),
    );
  }
}
