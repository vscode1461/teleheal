import 'package:flutter/material.dart';
import 'package:teleheal_assignment/views/dashboard/Dashboard.dart';

class GlobalFunctions {
  static navigate(context, whereTo) async {
    if (whereTo == 0) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) {
        return Dashboard();
      }), (route) => false);
    } else if (whereTo == 1) {
      /*Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) {
        return RS();
      }), (route) => false);*/
    } else if (whereTo == 2) {
      /*Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) {
        return Order();
      }), (route) => false);*/
    } else if (whereTo == 3) {
      /*Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) {
        return Klinik();
      }), (route) => false);*/
    } else {
      /*Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) {
        return Profile();
      }), (route) => false);*/
    }
  }
}
