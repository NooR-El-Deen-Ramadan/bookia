class AuthStates {}

class AuthInitState extends AuthStates {}

class AuthLoading extends AuthStates {}

class AuthSuccess extends AuthStates {}

class AuthError extends AuthStates {
  final String error;

  AuthError({required this.error});
}
