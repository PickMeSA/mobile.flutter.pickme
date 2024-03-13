import 'package:equatable/equatable.dart';

class SessionSecretsEntity extends Equatable {
  final String sessionId;
  final int ttl;

  const SessionSecretsEntity({
    required this.sessionId,
    required this.ttl,
  });

  @override
  List<Object> get props => [sessionId, ttl];

  @override
  String toString() {
    return 'SessionSecretsEntity(sessionId: $sessionId, ttl: $ttl)';
  }
}