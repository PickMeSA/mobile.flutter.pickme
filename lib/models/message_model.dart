class MessageModel {
  late String senderId;
  late String receiverId;
  late String messageText;
  late DateTime messageDate;

  MessageModel({
    required this.senderId,
    required this.receiverId,
    required this.messageText,
    required this.messageDate,
  });
}
