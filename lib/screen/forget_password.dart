import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/widget/custom_textfield.dart';
import 'package:flutter_application_test/widget/resetpass_complete.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded)),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'forgetpass_txt'.tr(),
                        style: TextStyle(fontSize: 22, color: Colors.black87, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'pleasefilleop_txt'.tr(),
                    style: TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CustomTextField(
                    textInputType: TextInputType.emailAddress,
                    title: 'eop_txt'.tr(),
                    validator: (val) {
                      final phonePattern = r'^[0-9]{10}$';
                      final emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

                      final phoneRegExp = RegExp(phonePattern);
                      final emailRegExp = RegExp(emailPattern);

                      if (val!.isEmpty) {
                        return 'pleasefilleop_txt'.tr();
                      } else if (phoneRegExp.hasMatch(val)) {
                        return null;
                      } else if (emailRegExp.hasMatch(val)) {
                        return null;
                      } else {
                        return 'pleasefilleopr_txt'.tr();
                      }
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ResetPassComplete(),
                            ));
                      }
                    },
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
                              'send_txt'.tr(),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
