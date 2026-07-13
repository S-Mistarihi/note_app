import 'package:flutter/material.dart';

class CustomIconButton {
  CustomIconButton._local();

  static final CustomIconButton _shared = CustomIconButton._local();

  factory CustomIconButton() => _shared;

  Widget buildIconButton({
    required VoidCallback onPressed,
    required Icon icon,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      iconSize: 30,
      style: IconButton.styleFrom(
        //backgroundColor: AppColors.iconBackgroundColor,
        //foregroundColor: AppColors.iconColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
