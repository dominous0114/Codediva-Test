import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/screen/forget_password.dart';
import 'package:flutter_application_test/screen/send_otp_screen.dart';
import 'package:flutter_application_test/widget/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool checkboxValue = false;
  bool obsecure = true;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: formkey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    CustomTextField(
                      title: 'username_txt'.tr(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'pleasefilldata_txt'.tr();
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'pleasefilldata_txt'.tr();
                        }
                        return null;
                      },
                      title: 'password_txt'.tr(),
                      enableSuffixIcon: true,
                      sufIcon: obsecure ? Icons.visibility : Icons.visibility_off,
                      visible: obsecure,
                      visiblePress: () {
                        setState(() {
                          obsecure = !obsecure;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: checkboxValue,
                                onChanged: (val) {
                                  setState(() {
                                    checkboxValue = !checkboxValue;
                                  });
                                }),
                            Text(
                              'savealive_txt'.tr(),
                              style: TextStyle(color: Colors.black54, fontSize: 14),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(
                              builder: (context) {
                                return ForgetPasswordScreen();
                              },
                            ));
                          },
                          child: Text(
                            'forgetpass_txt'.tr(),
                            style: TextStyle(color: Theme.of(context).cardColor, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CupertinoButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => SendOtpScreen(),
                              ));
                        }
                      },
                      padding: EdgeInsets.zero,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).cardColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'login_txt'.tr(),
                                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Divider(),
                          )),
                          Text(
                            'nouser_txt'.tr(),
                            style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Divider(),
                          )),
                        ],
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          border: Border.all(color: Theme.of(context).cardColor),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'register_txt'.tr(),
                                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                      color: Theme.of(context).cardColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
