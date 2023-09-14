import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/cubit/otp_timer/otp_timer_cubit.dart';
import 'package:flutter_application_test/cubit/otp_timer/otp_timer_state.dart';
import 'package:flutter_application_test/screen/pin_setting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class ReceiveOtpScreen extends StatefulWidget {
  const ReceiveOtpScreen({super.key});

  @override
  State<ReceiveOtpScreen> createState() => _ReceiveOtpScreenState();
}

class _ReceiveOtpScreenState extends State<ReceiveOtpScreen> {
  FocusNode otpNode = FocusNode();

  @override
  void initState() {
    otpNode.requestFocus();
    super.initState();
  }

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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'verify_txt'.tr(),
                    style: TextStyle(fontSize: 22, color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'pleasefillotp_txt'.tr(),
                style: TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              Text(
                '09x-xxx-xx28',
                style: TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              otpTextfield(),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ifnotrec_txt'.tr(),
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              BlocBuilder<OtpTimerCubit, OtpTimerState>(
                builder: (context, state) {
                  if (state is OtpTimerInitial) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<OtpTimerCubit>(context).startOtpTimer(0);
                          },
                          child: Text(
                            'resend_txt'.tr(),
                            style: TextStyle(color: Theme.of(context).cardColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  } else if (state is OtpTimerInProgress) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'resend_txt'.tr() + ' (${state.elapsed})',
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'resend_txt'.tr(),
                          style: TextStyle(color: Theme.of(context).cardColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget otpTextfield() {
    final length = 6;
    const borderColor = Color.fromRGBO(114, 178, 238, 1);
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color.fromRGBO(222, 231, 240, .57);
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black54),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return SizedBox(
      height: 60,
      child: Pinput(
        focusNode: otpNode,
        length: length,
        defaultPinTheme: defaultPinTheme,
        onCompleted: (pin) {
          print('oncom $pin');
          Navigator.pushReplacement(context, CupertinoPageRoute(
            builder: (context) {
              return PinSettingScreen();
            },
          ));
        },
        focusedPinTheme: defaultPinTheme.copyWith(
          height: 60,
          width: 60,
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: borderColor),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: errorColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
