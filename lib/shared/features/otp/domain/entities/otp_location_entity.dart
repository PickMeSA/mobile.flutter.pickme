import 'package:equatable/equatable.dart';

class OTPLocationEntity extends Equatable{
  String? id;
  int? latitude;
  int? longitude;

  @override
  // TODO: implement props
  List<Object?> get props => [id];

  OTPLocationEntity({
    required this.id,
    required this.latitude,
    required this.longitude});


}