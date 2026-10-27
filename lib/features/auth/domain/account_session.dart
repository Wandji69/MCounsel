class AccountSession {
  const AccountSession({
    required this.userId,
    required this.displayName,
    required this.role,
  });

  final String userId;
  final String displayName;
  final String role;

  factory AccountSession.fromJson(Map<String, Object?> json) {
    final id = json['id'];
    final displayName = json['display_name'];
    final role = json['role'];
    if (id is! String || displayName is! String || role is! String) {
      throw const AuthException('The account response was incomplete.');
    }
    return AccountSession(userId: id, displayName: displayName, role: role);
  }
}

class AuthException implements Exception {
  const AuthException(this.message);

  final String message;

  @override
  String toString() => message;
}
