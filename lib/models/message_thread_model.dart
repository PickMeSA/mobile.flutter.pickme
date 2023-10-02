import 'package:app/models/user_model.dart';

class MessageThreadModel {
  late UserModel chatPerson;
  late UserModel currentUser;
  late String lastMessageText;
  late DateTime lastMessageDate;

  MessageThreadModel({
    required this.chatPerson,
    required this.currentUser,
    required this.lastMessageText,
    required this.lastMessageDate,
  });
}
