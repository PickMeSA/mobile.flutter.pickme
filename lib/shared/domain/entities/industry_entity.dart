import 'package:equatable/equatable.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';

class IndustryEntity extends Equatable{
  final String id;
  final String industry;
  const IndustryEntity({required this.id,
        required this.industry,
      });
  @override
  List<Object?> get props => [id, industry];
}

