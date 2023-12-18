class BookingEntity{
  final String id;
  final String customerUid;
  final String labourerUid;
  final String startDate;
  final String endDate;
  final int estimatedHours;
  final String comments;
  final String type;
  final String applied;
  final String bookingId;

  BookingEntity({
    required this.id,
    required this.endDate,
    required this.startDate,
    required this.type,
    required this.applied,
    required this.bookingId,
    required this.comments,
    required this.customerUid,
    required this.estimatedHours,
    required this.labourerUid
});
}