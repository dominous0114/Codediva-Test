import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter_application_test/cubit/otp_timer/otp_timer_state.dart';
import 'package:flutter_application_test/repositories/otp_repositories.dart';

class OtpTimerCubit extends Cubit<OtpTimerState> {
  OtpTimerCubit() : super(const OtpTimerInitial());

  Timer? _timer;
  onTick(Timer timer) {
    if (state is OtpTimerInProgress) {
      OtpTimerInProgress wip = state as OtpTimerInProgress;
      if (wip.elapsed! > 0) {
        emit(OtpTimerInProgress(wip.elapsed! - 1));
      } else {
        _timer!.cancel();
        emit(const OtpTimerInitial());
      }
    }
  }

  startOtpTimer([int? index]) async {
    await OtpRepositories().registerOtp(phone: '0972943428');
    emit(const OtpTimerInProgress(60));
    _timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }
}
