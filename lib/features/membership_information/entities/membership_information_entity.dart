import 'information_item_entity.dart';
import 'membership_item_entity.dart';

class MembershipInformationEntity {

  final MembershipItemEntity membershipItemEntity;
  final List<InformationItemEntity> informationItemWEntityList;


  MembershipInformationEntity({required this.membershipItemEntity, required this.informationItemWEntityList});
}