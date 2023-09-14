import 'package:equatable/equatable.dart';

abstract class OtpTimerState extends Equatable {
  final int? elapsed;
  const OtpTimerState(this.elapsed);
}

class OtpTimerInitial extends OtpTimerState {
  const OtpTimerInitial() : super(0);

  @override
  List<Object?> get props => [];
}

class OtpTimerInProgress extends OtpTimerState {
  const OtpTimerInProgress(int? elapsed) : super(elapsed);

  @override
  List<Object?> get props => [elapsed];
}
