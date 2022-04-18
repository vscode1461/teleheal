import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static var primaryWhite = Colors.white;
  static var primaryLightGrey1 = Color(0xFFF7F7F7);
  static var primaryLightGrey2 = Color(0xFF87868B);
  static var primaryDarkGrey = Color(0xFF58585A);
  static var primaryDark = Color(0xFF121212);
  static var primaryColor = Color(0xFFF26A30);

  static var primaryTransparent = Colors.transparent;

  static activeInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: AppTheme.primaryColor,
        width: 1,
      ),
    );
  }

  static customAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppTheme.primaryWhite,
      leading: Icon(
        EvaIcons.gridOutline,
        color: AppTheme.primaryLightGrey2,
      ),
      title: Text('Teleheal',
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(color: AppTheme.primaryLightGrey2))),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 15, bottom: 3),
          child: Icon(
            EvaIcons.bellOutline,
            color: AppTheme.primaryLightGrey2,
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: AppTheme.primaryDarkGrey)),
                child: Text(
                  'Label',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(fontWeight: FontWeight.w500)),
                ),
              ),
              Container(
                width: 150,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: AppTheme.primaryDarkGrey)),
                child: Text(
                  'Label',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
