import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/cubit/otp_timer/otp_timer_cubit.dart';
import 'package:flutter_application_test/cubit/otp_timer/otp_timer_state.dart';
import 'package:flutter_application_test/screen/receive_otp_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SendOtpScreen extends StatefulWidget {
  const SendOtpScreen({super.key});

  @override
  State<SendOtpScreen> createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded)),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: LottieBuilder.asset(
                          'assets/lotties/otp_lottie.json',
                          repeat: false,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'otpto_txt'.tr(),
                  style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
                ),
                Text(
                  '09x-xxx-xx28',
                  style: TextStyle(fontSize: 18, color: Theme.of(context).cardColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                BlocBuilder<OtpTimerCubit, OtpTimerState>(
                  builder: (context, state) {
                    if (state is OtpTimerInitial) {
                      return sendOtpButton(onPressed: () {
                        print('on initial');
                        BlocProvider.of<OtpTimerCubit>(context).startOtpTimer();
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ReceiveOtpScreen(),
                            ));
                      });
                    } else if (state is OtpTimerInProgress) {
                      return sendOtpButton(onPressed: () {
                        print('on progress');
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ReceiveOtpScreen(),
                            ));
                      });
                    } else {
                      return sendOtpButton(onPressed: () {
                        print('on etc');
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ReceiveOtpScreen(),
                            ));
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'callcenter_txt'.tr(),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sendOtpButton({required Function() onPressed}) {
    return CupertinoButton(
      onPressed: onPressed,
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
                'reqotp_txt'.tr(),
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
