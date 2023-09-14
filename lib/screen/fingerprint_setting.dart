import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/repositories/local_auth.dart';
import 'package:flutter_application_test/screen/pin_check.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FingerPrintSetting extends StatefulWidget {
  const FingerPrintSetting({super.key});

  @override
  State<FingerPrintSetting> createState() => _FingerPrintSettingState();
}

class _FingerPrintSettingState extends State<FingerPrintSetting> {
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Biometric Authentication',
              style: TextStyle(fontSize: 22, color: Colors.black87, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'bioset_txt'.tr(),
                    style: TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  'assets/lotties/fingerprint.json',
                  width: 200,
                  repeat: false,
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            CupertinoButton(
              onPressed: () async {
                SharedPreferences preferences = await SharedPreferences.getInstance();
                preferences.setBool('islocalauth', true);
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) {
                    return PinCheck();
                  },
                ));
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
                        'bio_txt'.tr(),
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
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () async {
                    SharedPreferences preferences = await SharedPreferences.getInstance();
                    preferences.setBool('islocalauth', false);
                    Navigator.push(context, CupertinoPageRoute(
                      builder: (context) {
                        return PinCheck();
                      },
                    ));
                  },
                  child: Text(
                    'pass_txt'.tr(),
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: Theme.of(context).cardColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
