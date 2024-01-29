import 'package:equatable/equatable.dart';

class ReviewUserEntity extends Equatable{
  final String? userId;
  final String? firstName;
  final String? surname;
  final String? profilePictureUrl;

  const ReviewUserEntity({this.userId, this.firstName, this.surname, this.profilePictureUrl});

  @override
  List<Object?> get props => [userId];
}