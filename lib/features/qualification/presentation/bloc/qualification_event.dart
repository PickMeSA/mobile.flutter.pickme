part of 'qualification_bloc.dart';
 @immutable
abstract class QualificationsPageEvent extends BaseEvent {}

class AddQualificationEvent extends QualificationsPageEvent{
  final OTPQualificationEntity otpQualificationEntity;

  AddQualificationEvent({required this.otpQualificationEntity});
}

class AddWorkExperienceEvent extends QualificationsPageEvent{
   final OTPWorkExperienceEntity otpWorkExperienceEntity;

   AddWorkExperienceEvent({required this.otpWorkExperienceEntity});
}
