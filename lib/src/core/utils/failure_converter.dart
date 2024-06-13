import 'package:brana/src/core/errors/failures.dart';

String mapFailureToMessage(Failure failure) {
  return failure.map(
    server: (_) => "Server Failure",
    cache: (_) => "Cache Failure",
    empty: (_) => "Empty Failure",
    credential: (_) => "Wrong Email or Password",
    duplicateEmail: (_) => "Email already taken",
    passwordNotMatch: (_) => "Password not match",
    invalidEmail: (_) => "Invalid email format",
    invalidPassword: (_) => "Invalid password format",
  );
}
