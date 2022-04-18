import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teleheal_assignment/components/utils/AppTheme.dart';

class CustomDialog {
  static Future getDialog(
      {@required String title,
      @required String message,
      @required BuildContext context,
      @required int popCount}) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title, style: GoogleFonts.montserrat()),
            content: Text(
              message,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: AppTheme.primaryDarkGrey)),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Tutup", style: GoogleFonts.montserrat()),
                onPressed: () {
                  for (int i = 0; i < popCount; i++) {
                    Navigator.of(context).pop();
                  }
                },
              )
            ],
          );
        });
  }

  static Future getDialogLoading(@required BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppTheme.primaryWhite,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 15),
                Text('Loading...'),
              ],
            ),
          ),
        );
      },
    );
  }
}
