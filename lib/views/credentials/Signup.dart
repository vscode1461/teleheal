import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teleheal_assignment/components/utils/AppTheme.dart';
import 'package:teleheal_assignment/components/utils/CustomStyle.dart';
import 'package:teleheal_assignment/components/utils/ScreenSizeHelper.dart';
import 'package:teleheal_assignment/components/widgets/CustomButton.dart';
import 'package:teleheal_assignment/components/widgets/CustomDialog.dart';
import 'package:teleheal_assignment/components/widgets/CustomLabel.dart';
import 'package:teleheal_assignment/views/credentials/Signin.dart';

class Signup extends StatefulWidget {
  @override
  _Signup createState() => _Signup();
}

class _Signup extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool autoValidate = false;

  String phone, email;

  TextEditingController _phone = new TextEditingController(),
      _email = new TextEditingController(),
      _password = new TextEditingController();

  void setLoadingState() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  sendData() async {
    if (_phone.text != "" && _email.text != "" && _password.text != "") {
      if (_formKey.currentState.validate()) {
        print('Successful');
        setState(() {
          CustomDialog.getDialogLoading(context);
        });
        await Future.delayed(Duration(seconds: 4));
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
          return Signin();
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
        body: LayoutBuilder(builder: (_, constraints) {
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
                            CustomLabel.getTitle(title: 'Sign Up'),
                            SizedBox(height: 10),
                            CustomLabel.getLabelField(title: 'Phone'),
                            TextFormField(
                              controller: _phone,
                              style: CustomStyle.getStyleFormField(),
                              keyboardType: TextInputType.phone,
                              validator: validatePhone,
                              onSaved: (String val) {
                                phone = val;
                              },
                              decoration: CustomStyle.inputDecoration(
                                  icons: EvaIcons.phoneCallOutline),
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                            ),
                            SizedBox(height: 25),
                            CustomLabel.getLabelField(title: 'Email'),
                            TextFormField(
                              controller: _email,
                              style: CustomStyle.getStyleFormField(),
                              keyboardType: TextInputType.emailAddress,
                              validator: validateEmail,
                              onSaved: (String val) {
                                email = val;
                              },
                              decoration: CustomStyle.inputDecoration(
                                  icons: EvaIcons.emailOutline),
                            ),
                            SizedBox(height: 25),
                            CustomLabel.getLabelField(title: 'Password'),
                            TextFormField(
                              controller: _password,
                              style: CustomStyle.getStyleFormField(),
                              keyboardType: TextInputType.visiblePassword,
                              decoration: CustomStyle.inputDecoration(
                                  icons: EvaIcons.lockOutline),
                              obscureText: true,
                            ),
                            SizedBox(height: 40),
                            CustomButton.getCustomButton(
                              color: AppTheme.primaryColor,
                              label: 'Sign Up',
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
                                    "Already have account?",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            color: AppTheme.primaryDarkGrey,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  SizedBox(width: 8),
                                  InkWell(
                                    child: Text(
                                      "Sign in",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 15,
                                              color: AppTheme.primaryColor,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(builder: (_) {
                                        return Signin();
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
        }),
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

  String validatePhone(String value) {
    Pattern pattern = r'(^(?:[+0]9)?[0-9]{3,10}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter phone number';
    } else if (!regExp.hasMatch(value)) {
      return 'Phone number up to 10 digits';
    }
  }
}
