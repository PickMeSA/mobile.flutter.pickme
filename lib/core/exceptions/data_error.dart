
class DataError extends Error {
  final String message;

  DataError(this.message);

  @override
  String toString() => message;
}