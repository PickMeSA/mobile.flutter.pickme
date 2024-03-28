abstract class CustomException {}

class GenericException implements Exception {
  final String message;

  GenericException(this.message);

  @override
  String toString() => message;

}