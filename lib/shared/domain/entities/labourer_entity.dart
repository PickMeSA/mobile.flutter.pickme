import 'package:pickme/features/pay_someone/data/response_models/pay_someone_model_response/labourer_model_response.dart';

class LabourerEntity{
  String? id;
  String? firstName;
  String? surname;
  double? averageRating;
  String? profileImage;
  String? address;


  LabourerEntity(
  {this.id,
  this.firstName,
  this.surname,
  this.address,
  this.profileImage,
  this.averageRating}
      );

  LabourerEntity.fromResponse({required LabourerModelResponse response}){
    id = response.id;
    firstName = response.firstName;
    surname = response.surname;
    averageRating = response.averageRating;
    address = response.address;
    profileImage = response.profileImage;
  }


  LabourerModelResponse toResponse (){
    return LabourerModelResponse(id: id, firstName: firstName, surname: surname, averageRating: averageRating, profileImage: profileImage, address: address);
  }
}