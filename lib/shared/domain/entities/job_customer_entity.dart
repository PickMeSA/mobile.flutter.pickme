import 'package:equatable/equatable.dart';

class JobCustomerEntity extends Equatable{

  final String? firstName;
  final String? surname;
  final int? averageRating;
  final String? profileImage;
  final String? address;

  const JobCustomerEntity({
    this.firstName,
    this.surname,
    this.averageRating,
    this.profileImage,
    this.address,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [profileImage];

}