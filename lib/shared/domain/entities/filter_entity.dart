import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pickme/shared/models/jobs/my_job_listings_job_model_response.dart';
import 'package:pickme/shared/constants/default_values.dart';

class FilterEntity{
  double? distance;
  double? estimatedHours;
  RangeValues? priceRange;
  int? rating;
  String? customerUid;
  String? industryId;
  double? lat;
  double? lng;

  FilterEntity({
    this.priceRange,
    this.distance,
    this.estimatedHours,
    this.rating,
    this.customerUid,
    this.industryId,
    this.lat,
    this.lng,
  }):assert((lat==null && lng==null) || (lat!=null && lng!=null));

  copyWith({
    double? distance_,
    RangeValues? priceRange_,
    double? estimatedHours_,
    int? rating_,
    String? customerUid_,
    String? industryId_,
  }){
    return FilterEntity(
      priceRange: priceRange_??priceRange,
      distance: distance_??distance,
      estimatedHours: estimatedHours_??estimatedHours,
      rating:rating_??rating,
      customerUid: customerUid_??customerUid,
      industryId: industryId_??industryId,
    );
  }
  @override
  String toString() {
    return ("FilterEntity {\npriceRange: $priceRange,\n distance: $distance,\n estimatedHours: $estimatedHours, \n rating: $rating");
  }

}