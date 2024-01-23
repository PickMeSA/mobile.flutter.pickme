import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pickme/features/my_bookings_upcoming/data/response_models/my_bookings_upcoming_model_response/booking_model_response.dart';
import 'package:pickme/features/my_bookings_upcoming/domain/entities/booking_entity.dart';
import 'package:pickme/shared/remote/api-service.dart';
import 'package:pickme/shared/services/remote/api_service/booking_service/booking_service.dart';

@Singleton(as: BookingService)
class BookingServiceImpl extends BookingService{

  final ApiService apiService;

  BookingServiceImpl({required this.apiService});
  @override
  Future<List<BookingEntity>> getRemoteBookings() async{
    try {
      Response<dynamic> response = await apiService.get(
          "$baseUrl$version/jobs/bookings");
      List<dynamic> bookingsList = response.data;
      List<BookingsModelResponse> bookingsModelList = bookingsList.map((e) =>
          BookingsModelResponse(
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
            labourerUid: element.labourerUid??""));
      });

      return bookingEntityList;
    }catch(ex){
      rethrow;
    }
  }

}