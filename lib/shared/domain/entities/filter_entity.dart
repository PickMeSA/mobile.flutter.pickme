import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pickme/shared/models/jobs/my_job_listings_job_model_response.dart';
import 'package:pickme/shared/constants/default_values.dart';

class FilterEntity extends Equatable{
  final double? distance;
  final double? estimatedHours;
  final RangeValues? priceRange;
  final int? rating;

  const FilterEntity({
    this.priceRange,
    this.distance,
    this.estimatedHours,
    this.rating,
  });

  copyWith({
    double? distance_,
    RangeValues? priceRange_,
    double? estimatedHours_,
    int? rating_,
  }){
    return FilterEntity(
      priceRange: priceRange_??priceRange,
      distance: distance_??distance,
      estimatedHours: estimatedHours_??estimatedHours,
      rating:rating_??rating,
    );
  }
  @override
  String toString() {
    return ("FilterEntity {\npriceRange: $priceRange,\n distance: $distance,\n estimatedHours: $estimatedHours, \n rating: $rating");
  }
  @override
  List<Object?> get props => [priceRange, distance, estimatedHours, rating];
}