import 'dart:async';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teleheal_assignment/components/utils/AppTheme.dart';
import 'package:teleheal_assignment/components/utils/CustomStyle.dart';
import 'package:teleheal_assignment/components/utils/ScreenSizeHelper.dart';
import 'package:teleheal_assignment/components/widgets/CustomButton.dart';
import 'package:teleheal_assignment/components/widgets/CustomDialog.dart';
import 'package:teleheal_assignment/components/widgets/CustomLabel.dart';
import 'package:teleheal_assignment/views/credentials/Signup.dart';
import 'package:teleheal_assignment/views/dashboard/Dashboard.dart';

class Signin extends StatefulWidget {
  @override
  _Signin createState() => _Signin();
}

class _Signin extends State<Signin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool autoValidate = false;

  String email;

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  void setLoadingState() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  sendData() async {
    if (_email.text != "" && _password.text != "") {
      if (_formKey.currentState.validate()) {
        print('Successful');
        setState(() {
          CustomDialog.getDialogLoading(context);
        });
        await Future.delayed(Duration(seconds: 4));
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return Dashboard();
        }));
      } else {
        setState(() {
          autoValidate = true;
        });
        print('Unsuccessful');
      }
    } else {
      CustomDialog.getDialog(
          title: 'Warning',
          message: 'Incomplete input data.',
          context: context,
          popCount: 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenSizeHelper.getDisplayWidth(context),
      height: ScreenSizeHelper.getDisplayHeight(
          context, ScreenSizeHelper.HEIGHT_WITH_STATUS_BAR),
      color: AppTheme.primaryWhite,
      child: Scaffold(
        backgroundColor: AppTheme.primaryTransparent,
        body: LayoutBuilder(
          builder: (_, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Form(
                          key: _formKey,
                          autovalidate: autoValidate,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomLabel.getTitle(title: 'Sign In'),
                              SizedBox(height: 10),
                              CustomLabel.getLabelField(title: 'Email'),
                              TextFormField(
                                controller: _email,
                                style: CustomStyle.getStyleFormField(),
                                decoration: CustomStyle.inputDecoration(
                                    icons: EvaIcons.emailOutline),
                                validator: validateEmail,
                                onSaved: (String val) {
                                  email = val;
                                },
                              ),
                              SizedBox(height: 25),
                              CustomLabel.getLabelField(title: 'Password'),
                              TextFormField(
                                controller: _password,
                                style: CustomStyle.getStyleFormField(),
                                decoration: CustomStyle.inputDecoration(
                                    icons: EvaIcons.lockOutline),
                                obscureText: true,
                              ),
                              SizedBox(height: 40),
                              CustomButton.getCustomButton(
                                color: AppTheme.primaryColor,
                                label: 'Sign In',
                                onPressed: sendData,
                              ),
                              SizedBox(height: 90),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have account?",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              fontSize: 15,
                                              color: AppTheme.primaryDarkGrey,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    SizedBox(width: 8),
                                    InkWell(
                                      child: Text(
                                        "Sign up",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 15,
                                                color: AppTheme.primaryColor,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(builder: (_) {
                                          return Signup();
                                        }), (route) => false);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            );
          },
        ),
      ),
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }
}
