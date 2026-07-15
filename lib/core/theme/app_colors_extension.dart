import 'package:flutter/material.dart';

@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color primaryTextColor;
  final Color secondaryTextColor;

  final Color borderColor;

  final Color menuBackgroundColor;

  final Color iconBackgroundColor;

  const AppColorsExtension({
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.borderColor,
    required this.menuBackgroundColor,
    required this.iconBackgroundColor,
  });

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? primaryTextColor,
    Color? secondaryTextColor,
    Color? borderColor,
    Color? menuBackgroundColor,
    Color? iconBackgroundColor,
  }) {
    return AppColorsExtension(
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      borderColor: borderColor ?? this.borderColor,
      menuBackgroundColor: menuBackgroundColor ?? this.menuBackgroundColor,
      iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      primaryTextColor: Color.lerp(
        primaryTextColor,
        other.primaryTextColor,
        t,
      )!,
      secondaryTextColor: Color.lerp(
        secondaryTextColor,
        other.secondaryTextColor,
        t,
      )!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      menuBackgroundColor: Color.lerp(
        menuBackgroundColor,
        other.menuBackgroundColor,
        t,
      )!,
      iconBackgroundColor: Color.lerp(
        iconBackgroundColor,
        other.iconBackgroundColor,
        t,
      )!,
    );
  }
}
