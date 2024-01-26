import 'package:equatable/equatable.dart';

class JobCustomerEntity extends Equatable{

  final String? id;
  final String? firstName;
  final String? surname;
  final int? averageRating;
  final String? profileImage;
  final String? address;

  const JobCustomerEntity({
    this.id,
    this.firstName,
    this.surname,
    this.averageRating,
    this.profileImage,
    this.address,
  });

  @override
  List<Object?> get props => [id];

}