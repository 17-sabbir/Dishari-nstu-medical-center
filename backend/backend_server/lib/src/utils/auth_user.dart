import 'package:serverpod/serverpod.dart';

int requireAuthenticatedUserId(Session session) {
  final auth = session.authenticated;
  if (auth == null) {
    throw StateError('User is not authenticated.');
  }

  final userId = int.tryParse(auth.userIdentifier);
  if (userId == null) {
    throw StateError('Invalid authenticated user id: ${auth.userIdentifier}');
  }

  return userId;
}

/// Loads the caller's role from `users.role` and throws if it isn't
/// one of [allowedRoles]. Use this at the top of any endpoint method
/// that must be restricted (e.g. LABSTAFF, ADMIN).
///
/// Returns the authenticated user id for convenience.
Future<int> requireRole(
  Session session,
  Set<String> allowedRoles,
) async {
  final userId = requireAuthenticatedUserId(session);

  final rows = await session.db.unsafeQuery(
    'SELECT role::text AS role FROM users WHERE user_id = @id LIMIT 1',
    parameters: QueryParameters.named({'id': userId}),
  );

  if (rows.isEmpty) {
    throw StateError('User not found.');
  }

  final role = rows.first.toColumnMap()['role']?.toString();
  if (role == null || !allowedRoles.contains(role)) {
    throw StateError('Forbidden: role "$role" is not allowed for this action.');
  }

  return userId;
}
