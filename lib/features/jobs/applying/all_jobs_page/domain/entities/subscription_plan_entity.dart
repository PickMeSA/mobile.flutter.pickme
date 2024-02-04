import 'package:equatable/equatable.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

class SubscriptionPlanEntity extends Equatable{
  final int id;
  final String name;
  final String subscriptionType;
  final double price;
  final List<String> includedItems;
  final EntityType entityType;

  const SubscriptionPlanEntity({required this.id, required this.name, required this.price, required this.includedItems, required this.entityType, required this.subscriptionType});
  @override
  List<Object?> get props => [id, name];
}

const List<SubscriptionPlanEntity> mockSubscriptionPlans = [
  SubscriptionPlanEntity(
    id: 1,
    name: "name",
    price: 50,
    entityType: EntityType.individual,
    subscriptionType: '',
    includedItems: [
      "Lifetime subscription",
      "Nationwide exposure",
      "Public endorsement",
      "Work opportunities",
      "Free investment portfolio",
      "Free printable CV",
      "Build your credit profile",
      "Develop me as a brand",
      "Advance my skills",
      "Smart Matching",
    ],
  )
];