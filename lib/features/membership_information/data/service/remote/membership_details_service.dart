import 'package:pickme/features/membership_information/entities/membership_information_entity.dart';
import 'package:pickme/shared/remote/PickMeApiCore.dart';

abstract class MembershipDetailsService extends PickMeCoreApi{
  MembershipDetailsService({required super.tokenLocalStorage});

  Future<List<MembershipInformationEntity>>  getMembershipInformationEntity();

}