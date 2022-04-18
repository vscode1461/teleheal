import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teleheal_assignment/components/GlobalFunctions.dart';
import 'package:teleheal_assignment/components/utils/AppTheme.dart';

class CustomButton {
  static Widget getCustomButton(
      {@required color, @required label, @required onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(14),
        child: Text(
          label,
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryWhite)),
        ),
        onPressed: onPressed,
      ),
    );
  }

  static Widget getBottomNav(context, currentIndex) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(EvaIcons.homeOutline),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(EvaIcons.checkmarkCircle2Outline),
          label: 'RS',
        ),
        BottomNavigationBarItem(
          icon: Icon(EvaIcons.checkmarkCircle),
          label: 'Klinik',
        ),
        BottomNavigationBarItem(
          icon: Icon(EvaIcons.personOutline),
          label: 'Profile',
        ),
      ],
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppTheme.primaryColor,
      unselectedItemColor: AppTheme.primaryLightGrey2,
      backgroundColor: AppTheme.primaryWhite,
      elevation: 0.0,
      onTap: (index) {
        GlobalFunctions.navigate(context, currentIndex);
      },
    );
  }
}
