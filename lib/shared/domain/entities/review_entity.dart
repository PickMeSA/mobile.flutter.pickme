import 'package:equatable/equatable.dart';
import 'package:pickme/shared/domain/entities/review_user_entity.dart';
import 'package:pickme/shared/domain/entities/reviewer_entity.dart';

class ReviewEntity extends Equatable{
  final String id;
  final int rating;
  final String review;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final ReviewerEntity? reviewer;
  final ReviewUserEntity? user;

  const ReviewEntity({required this.id, required this.rating, required this.review, required this.createdAt, this.updatedAt, this.reviewer, this.user});

  @override
  List<Object?> get props => [id];
}