
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@singleton
class ProgramCache {
  final logger = Logger(printer: PrettyPrinter());

  String? _profileUrl;

  String? get profileUrl => _profileUrl;

  updateProfileUrl(String? profileUrl) {
    if (profileUrl == null) {
      logger.i("ProgramCache: Cannot update profile url to null value");
      return;
    }
    // TODO: - Add validation of the argument
    _profileUrl = profileUrl;
  }
}