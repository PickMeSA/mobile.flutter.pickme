import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/my_bookings_upcoming/data/response_models/my_bookings_upcoming_model_response/booking_model_response.dart';
import 'package:pickme/features/my_bookings_upcoming/data/response_models/my_bookings_upcoming_model_response/customer_model_response.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/customer_entity.dart';
import 'package:pickme/features/pay_someone/data/response_models/pay_someone_model_response/labourer_model_response.dart';
import 'package:pickme/shared/domain/entities/job_entity.dart';
import 'package:pickme/shared/domain/entities/labourer_entity.dart';
import 'package:pickme/shared/local/hive_storage_init.dart';
import 'package:pickme/shared/models/jobs/my_job_listings_job_model_response.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/local/Hive/user_local_storage/user/user_model.dart';
import 'package:pickme/shared/services/remote/api_service/booking_service/booking_service.dart';

import '../../../local/Hive/user_local_storage/user_local_storage.dart';

@Singleton(as: BookingService)
class BookingServiceImpl extends BookingService{

  final ApiService apiService;

  BookingServiceImpl({required this.apiService});
  @override
  Future<List<BookingEntity>> getRemoteBookings() async{
    UserLocalStorage userLocalStorage = locator<UserLocalStorage>();
    UserModel userModel = userLocalStorage.getUser();
    try {
      Response<dynamic> response = await apiService.get(
          "$baseUrl$version/jobs/jobInterests/booking?profileType=${userModel.type}");
      List<dynamic> bookingsList = response.data;
      List<BookingsModelResponse> bookingsModelList = bookingsList.map((e) =>
          BookingsModelResponse(
            labourer: LabourerModelResponse.fromJson(e['labourer']),
            labourerHourlyRate: e['labourerHourlyRate'],
            startTime: e['startTime'],
            previousStatus: e["previousStatus"],
            customer: CustomerModelResponse.fromJson(e!["customer"]),
              job: MyJobListingsJobModelResponse.fromJson(e['job']),
              proposedAltEndDate: e['proposedAltEndDate'],
              proposedAltStartDate: e['proposedAltStartDate'],
              proposedAltStartTime: e['proposedAltStartTime'],
              proposerUid: e['proposerUid'],
              reasonForChange: e['reasonForChange'],
              jobId: e["jobId"],
              name: e["name"],
              id: e["id"],
              endDate: e["endDate"],
              startDate: e["startDate"],
              type: e["type"],
              applied: e["applied"],
              bookingId: e["bookingId"],
              comments: e["comments"],
              customerUid: e["customerUid"],
              estimatedHours: e["estimatedHours"],
              status: e["status"],
              labourerUid: e["labourerUid"])).toList();
      List<BookingEntity> bookingEntityList = [];

      bookingsModelList.forEach((element) {
        bookingEntityList.add(BookingEntity(
          labourerEntity: LabourerEntity.fromResponse(response: element.labourer??const LabourerModelResponse(id: "id", firstName: "firstName", surname: "surname", averageRating: -1, profileImage: "profileImage", address: "address")),
          labourerHourlyRate: element.labourerHourlyRate??0,
          startTime: element.startTime,
          previousStatusString: element.previousStatus??"",
          statusString: element.status??"",
            jobId: element.jobId??"",
            id: element.id??"",
            endDate: element.endDate??DateTime.now().toString(),
            startDate: element.startDate?? DateTime.now().toString(),
            type: element.type??"Unknown",
            applied: element.applied??"",
            bookingId: element.bookingId??"",
            comments: element.comments??"",
            customerUid: element.customerUid??"",
            estimatedHours: element.estimatedHours??0,
            labourerUid: element.labourerUid??"",
            reasonForChange: element.reasonForChange!,
            customer: CustomerEntity.fromResponse(element.customer??CustomerModelResponse()),
            job: JobEntity.fromResponse(element.job??MyJobListingsJobModelResponse()),
            proposedAltEndDate: element.proposedAltEndDate!,
            proposedAltStartDate: element.proposedAltStartDate!,
            proposedAltStartTime: element.proposedAltStartTime!,
            proposerUid: element.proposerUid!));
      });

      return bookingEntityList;
    }catch(ex){
      rethrow;
    }
  }

}