const  _defaultBoolean = false;

bool isNullOrDefault<T>(T? value) {
  if (value == null) return true;

  if (value is List?) {
    final list = value as List?;
    if (list != null) {
      return value == null || list.isEmpty;
    }
  }

  if (value is String?) {
    final string = value as String?;
    if (string != null) {
      return string == null || string.isEmpty;
    }
  }

  if (value is bool?) {
    final boolean = value as bool?;
    if (bool != null) {
      return bool == null || boolean == _defaultBoolean;
    }
  }
  if (value is int?) {
    final integer = value as int?;
    if (integer != null) {
      return bool == null || integer == 0;
    }
  }
  return false;
}
