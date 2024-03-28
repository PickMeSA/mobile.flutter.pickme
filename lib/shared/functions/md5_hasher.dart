import 'dart:convert';

import 'package:crypto/crypto.dart';

String generateHash(String secret, String salt) =>
    md5.convert(utf8.encode(salt+secret)).toString();