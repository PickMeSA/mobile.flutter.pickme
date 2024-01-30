import 'package:equatable/equatable.dart';

class WorkTimesEntity extends Equatable {
  final String? startTime;
  final String? endTime;
  final List<String>? workingDays;

  const WorkTimesEntity({
    this.startTime,
    this.endTime,
    this.workingDays,
  });

  @override
  List<Object?> get props => [startTime, endTime, workingDays];

  @override
  bool get stringify => true;
}
