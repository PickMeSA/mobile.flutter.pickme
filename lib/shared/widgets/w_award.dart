import 'package:flutter_ui_components/flutter_ui_components.dart';

class Award extends QualificationContract{
  Award({
    required super.name,
    required super.qualificationType,
    required super.institutionName,
    super.issuedOn,
    super.educationType,
    super.dateEnded,
    super.dateStarted
  });
}