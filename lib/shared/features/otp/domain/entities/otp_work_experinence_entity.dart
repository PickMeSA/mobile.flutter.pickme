class OTPWorkExperienceEntity {
  String? title;
  String? company;
  bool? isCurrent;
  int? industryId;
  String? startDate;
  String? endDate;

  OTPWorkExperienceEntity({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.company,
    required this.industryId,
    required this.isCurrent
  });
}