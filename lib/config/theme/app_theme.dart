import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecorationType _defaultDecorationType = InputDecorationType.outline;

ShadedColor _selectedColor = ZeroColors.primary;
bool _customFont = false;
bool _dark = false;

class AppTheme {
  AppTheme();

  ZeroThemeData theme() {
    return ZeroThemeData(
        fontFamily: _customFont ? GoogleFonts.dancingScript().fontFamily : null,
        brightness: _dark ? Brightness.dark : Brightness.light,
        primaryColor: _selectedColor.toAccentColor(),
        textfieldStyleSet: ZeroTextfieldStyleSet.fallback(
            textfieldSize: ZeroTextfieldSize.small,
            defaultDecorationType: _defaultDecorationType,
            focusedBorderColor: _selectedColor,
            focusedColor: _selectedColor));
  }
}
