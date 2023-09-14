import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/screen/fingerprint_setting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinSettingScreen extends StatefulWidget {
  const PinSettingScreen({super.key});

  @override
  State<PinSettingScreen> createState() => _PinSettingScreenState();
}

class _PinSettingScreenState extends State<PinSettingScreen> {
  TextEditingController pinController = TextEditingController();
  bool confirmStatus = false;
  String? confirmText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            confirmStatus
                ? Text(
                    'acceptpin_txt'.tr(),
                    style: TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  )
                : Text(
                    'createpin_txt'.tr(),
                    style: TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
            SizedBox(
              height: 40,
            ),
            Pinput(
              onCompleted: (val) {
                Future.delayed(Duration(milliseconds: 500), () async {
                  pinController.clear();

                  print(confirmStatus);
                  if (confirmStatus == false) {
                    setState(() {
                      confirmStatus = true;

                      confirmText = val;
                    });
                  } else {
                    if (confirmText == val) {
                      SharedPreferences preferences = await SharedPreferences.getInstance();
                      preferences.setBool('islogin', true);
                      preferences.setString('pin', val);
                      Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => FingerPrintSetting(),
                          ));
                    } else {
                      Fluttertoast.showToast(msg: 'PIN ไม่ถูกต้อง', gravity: ToastGravity.CENTER);
                    }
                  }
                });
              },
              obscureText: true,
              obscuringWidget: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).cardColor),
              ),
              readOnly: true,
              defaultPinTheme: PinTheme(
                width: 60,
                height: 60,
                textStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black54),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.deepPurple.shade100,
                    ),
                    color: Colors.white),
              ),
              controller: pinController,
              length: 4,
            ),
            Expanded(child: SizedBox()),
            buildNumPadWidget(),
          ],
        ),
      ),
    );
  }

  addLetter(String letter) {
    String currentText = pinController.text;
    String newText = currentText + letter;
    pinController.text = newText;
  }

  removeLetter() {
    String currentText = pinController.text;
    if (currentText.isNotEmpty) {
      String newText = currentText.substring(0, currentText.length - 1);
      pinController.text = newText;
    }
  }

  Widget buildNumberButton(String str) {
    return Expanded(
        child: str == ''
            ? Container(
                color: Colors.white,
                height: 120,
              )
            : CupertinoButton(
                onPressed: str == 'back'
                    ? () {
                        removeLetter();
                      }
                    : () {
                        addLetter(str);
                      },
                padding: EdgeInsets.zero,
                child: Container(
                    color: Colors.white,
                    height: 120,
                    child: Center(
                        child: str == 'back'
                            ? Icon(
                                CupertinoIcons.delete_left_fill,
                                size: 24,
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Theme.of(context).cardColor,
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Text(str,
                                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                          )),
                                ),
                              ))),
              ));
  }

  Widget buildNumPadWidget() {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(children: [
              buildNumberButton("1"),
              buildNumberButton("2"),
              buildNumberButton("3"),
            ]),
            Row(children: [
              buildNumberButton("4"),
              buildNumberButton("5"),
              buildNumberButton("6"),
            ]),
            Row(children: [
              buildNumberButton("7"),
              buildNumberButton("8"),
              buildNumberButton("9"),
            ]),
            Row(children: [
              buildNumberButton(""),
              buildNumberButton("0"),
              buildNumberButton("back"),
            ]),
          ],
        ));
  }
}
