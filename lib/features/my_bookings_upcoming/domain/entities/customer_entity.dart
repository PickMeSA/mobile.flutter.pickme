import 'package:pickme/features/my_bookings_upcoming/data/response_models/my_bookings_upcoming_model_response/customer_model_response.dart';

class CustomerEntity {
   String? id;
   String? firstName;
   String? surname;
   String? profileImage;
   String? address;

  CustomerEntity({
    required this.address,
    required this.id,
    required this.firstName,
    required this.surname,
    required this.profileImage});

  CustomerModelResponse toResponse(){
    return CustomerModelResponse(
        id: id,
        firstName: firstName,
        surname: surname,
        profileImage: profileImage, address: address);
  }

  CustomerEntity.fromResponse(CustomerModelResponse response){
    id = response.id;
    firstName = response.firstName;
    surname = response.surname;
    profileImage = response.profileImage;
    address = response.address;
  }
}