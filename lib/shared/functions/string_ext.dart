bool isNullOrEmpty<T>(T? value) {
  if (value == null) return true;

  final list = value as List?;
  if (list != null) {
    return value == null || list.isEmpty;
  }
  final string = value as String?;
  if (string != null) {
    return string == null || string.isEmpty;
  }

  final boolean = value as bool?;
  if (bool != null) {
    return bool == null || boolean == 0;
  }

  return false;
}
