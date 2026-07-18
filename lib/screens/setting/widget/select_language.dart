import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../generated/l10n.dart';
import '../../../l10n/app_locale.dart';
import '../../../utils/custom_icon_button.dart';
import '../../splash/splash_screen.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  late String _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = AppLocale().locale.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6.h),
            CustomIconButton().buildIconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios_new),
            ),
            SizedBox(height: 2.h),
            Text(
              S.of(context).selectLanguageLabel,
              style: GoogleFonts.nunito(
                fontSize: 28,
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.h),
            _buildLanguageTile(
              languageCode: 'ar',
              languageName: S.of(context).arabicLanguageSelect,
            ),
            const Divider(thickness: 2, color: AppColor.buttonBackground),
            _buildLanguageTile(
              languageCode: 'en',
              languageName: S.of(context).englishLanguageSelect,
            ),
            const Divider(thickness: 2, color: AppColor.buttonBackground),
            _buildLanguageTile(
              languageCode: 'fr',
              languageName: S.of(context).FranceLanguageSelect,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () async {
                  AppLocale().changeLanguage(languageCode: _selectedLanguage);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const SplashScreen()),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: AppColor.basicWhite,
                ),
                child: Text(
                  S.of(context).saveChangesButton,
                  style: AppTextStyle.font20WhiteBold,
                ),
              ),
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageTile({
    required String languageCode,
    required String languageName,
  }) {
    final bool isSelected = _selectedLanguage == languageCode;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        setState(() {
          _selectedLanguage = languageCode;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Text(
                languageName,
                style: GoogleFonts.nunito(
                  fontSize: 28,
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (isSelected) const SizedBox(width: 12),
            if (isSelected) const Icon(Icons.check_circle, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
