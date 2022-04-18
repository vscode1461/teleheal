import 'dart:async';
import 'package:flutter/material.dart';
import 'package:teleheal_assignment/components/utils/ScreenSizeHelper.dart';
import 'package:teleheal_assignment/views/credentials/Signin.dart';

class Splashscreen extends StatefulWidget {
  @override
  _Splashscreen createState() => _Splashscreen();
}

class _Splashscreen extends State<Splashscreen> {
  bool isLoading = false;

  void setLoadingState() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    super.initState();

    _startTimer();
  }

  _startTimer() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, () async {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return Signin();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Image.asset(
        'images/logo.png',
        width: ScreenSizeHelper.getDisplayWidth(context),
        height: ScreenSizeHelper.getDisplayHeight(
            context, ScreenSizeHelper.HEIGHT_FULL),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
