import 'package:equatable/equatable.dart';
import 'package:pickme/shared/domain/entities/industry_entity.dart';

class ReviewerEntity extends Equatable{
  final String? reviewerId;
  final String? firstName;
  final String? surname;
  final String? profilePictureUrl;
  final String? relationship;
  final IndustryEntity? industry;

  const ReviewerEntity({this.reviewerId, this.firstName, this.surname, this.profilePictureUrl, this.industry, this.relationship});

  @override
  List<Object?> get props => [reviewerId];
}