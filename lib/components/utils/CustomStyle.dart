import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'AppTheme.dart';

class CustomStyle {
  static inputDecoration({@required icons}) {
    return InputDecoration(
      prefixIcon: Icon(icons, color: AppTheme.primaryDarkGrey, size: 18),
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
      filled: true,
      fillColor: AppTheme.primaryLightGrey1,
      focusedBorder: AppTheme.activeInputBorder(),
    );
  }

  static TextStyle getStyleFormField() {
    return GoogleFonts.montserrat(
        textStyle: TextStyle(color: AppTheme.primaryDark));
  }

  static TextStyle getStyleTitle() {
    return GoogleFonts.montserrat(
        textStyle: TextStyle(
            fontSize: 36,
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.w300));
  }

  static TextStyle getStyleLabelField() {
    return GoogleFonts.montserrat(
        textStyle: TextStyle(
            fontSize: 16,
            color: AppTheme.primaryDarkGrey,
            fontWeight: FontWeight.w300));
  }

  static TextStyle selectLabelStyle() {
    return GoogleFonts.montserrat(
        textStyle: TextStyle(
            color: AppTheme.primaryDarkGrey,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w500,
            fontSize: 18));
  }

  static TextStyle unselectLabelStyle() {
    return GoogleFonts.montserrat(
        textStyle: TextStyle(
            color: AppTheme.primaryDarkGrey,
            fontWeight: FontWeight.w500,
            fontSize: 18));
  }
}
